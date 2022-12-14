import 'dart:html';
import 'dart:io';

import 'package:eva2_flutter/models/ProductosReport.dart';
import 'package:eva2_flutter/models/producto_reporte_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:eva2_flutter/models/card_product.dart';
import 'package:eva2_flutter/models/productResponse.dart';

class ProductosProvider extends ChangeNotifier {
  String _baseUrl = '192.168.43.25:7000';

  List<CardProduct> listProductos = [];
  List<ProductosReport> listaProductosReport = [];

  ProductosProvider() {
    print('Ingresando a productos provider');
    this.getListProductos();
    this.reporteProductos();
  }

  getListProductos() async {
    var url = Uri.http(_baseUrl, '/api/productos');
    final response = await http.get(url);
    print(response.body);

    final productResponse = ProductosResponse.fromJson(response.body);
    listProductos = productResponse.productos;
    notifyListeners();
  }

  postSaveProducto(CardProduct cardProduct) async {
    var url = Uri.http(_baseUrl, '/api/productos/save');
    print(cardProduct.toJson());
    final response = await http.post(url,
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: cardProduct.toJson());

    print(response);
    getListProductos();
    notifyListeners();
  }

  reporteProductos() async {
    var url = Uri.http(_baseUrl, '/api/reportes/prodcutosreport');
    final response = await http.get(url);

    print(response.body);
    final productosReportResponse =
        ProductosReportResponse.fromJson(response.body);
    listaProductosReport = productosReportResponse.productosReport;
    notifyListeners();
  }
}
