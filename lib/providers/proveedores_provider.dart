import 'dart:html';
import 'dart:io';

import 'package:eva2_flutter/models/card_proveedor.dart';
import 'package:eva2_flutter/models/proveedorReport.dart';
import 'package:eva2_flutter/models/proveedorResponse.dart';
import 'package:eva2_flutter/models/proveedores_report_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:eva2_flutter/models/card_product.dart';
import 'package:eva2_flutter/models/productResponse.dart';

class ProveedoresProvider extends ChangeNotifier {
  String _baseUrl = '192.168.43.25:8000';

  List<CardProveedor> proveedores = [];
  List<ProveedoresReport> listaProveedoresReport = [];

  ProveedoresProvider() {
    print('Ingresando a provedores provider');
    this.getListProveedores();
    this.reporteProveedores();
  }

  getListProveedores() async {
    var url = Uri.http(_baseUrl, '/api/proveedores');
    final response = await http.get(url);
    print(response.body);

    final proveedorResponse = ProveedorResponse.fromJson(response.body);
    proveedores = proveedorResponse.proveedores;
    notifyListeners();
  }

  postSaveProveedor(CardProveedor cardProveedor) async {
    var url = Uri.http(_baseUrl, '/api/proveedores/save');
    print(cardProveedor.toJson());
    final response = await http.post(url,
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: cardProveedor.toJson());

    print(response);
    getListProveedores();
    notifyListeners();
  }

  reporteProveedores() async {
    var url = Uri.http(_baseUrl, '/api/reportes/proveedoresreport');
    final response = await http.get(url);

    print(response.body);
    final proveedoresReportResponse =
        ProveedoesReportResponse.fromJson(response.body);
    listaProveedoresReport = proveedoresReportResponse.proveedoresReport;
    notifyListeners();
  }
}
