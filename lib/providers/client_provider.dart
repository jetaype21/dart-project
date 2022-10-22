import 'dart:html';
import 'dart:io';

import 'package:eva2_flutter/models/card_client.dart';
import 'package:eva2_flutter/models/clientResponse.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:eva2_flutter/models/card_product.dart';
import 'package:eva2_flutter/models/productResponse.dart';

class ClientesProvider extends ChangeNotifier {
  
  String _baseUrl = '192.168.43.25:8000';

  List<CardCliente> clientes = [];

  ClientesProvider() {
    print('Ingresando a clientes provider');
    this.getListClientes();
  }

  getListClientes() async {
    var url = Uri.http(_baseUrl, '/api/clientes');
    final response = await http.get(url);
    print(response.body);

    final clienteResponse = ClienteResponse.fromJson(response.body);
    clientes = clienteResponse.clientes;
    notifyListeners();
  }

  postSaveClient(CardCliente cardCliente) async {
    var url = Uri.http(_baseUrl, '/api/clientes/save');
    print(cardCliente.toJson());
    final response = await http.post(url,
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: cardCliente.toJson());

    print(response);
    getListClientes();
    notifyListeners();
  }
}
