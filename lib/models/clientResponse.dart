// To parse this JSON data, do
//
//     final ClienteResponse = ClienteResponseFromMap(jsonString);

import 'dart:convert';

import 'package:eva2_flutter/models/card_client.dart';

class ClienteResponse {
  
  ClienteResponse({
    required this.clientes,
  });

  List<CardCliente> clientes;

  factory ClienteResponse.fromJson(String str) =>
      ClienteResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ClienteResponse.fromMap(Map<String, dynamic> json) => ClienteResponse(
        clientes: List<CardCliente>.from(
            json["clientes"].map((x) => CardCliente.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "clientes": List<dynamic>.from(clientes.map((x) => x.toMap())),
      };
}
