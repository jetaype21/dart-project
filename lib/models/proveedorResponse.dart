// To parse this JSON data, do
//
//     final proveedorItem = proveedorItemFromMap(jsonString);

import 'dart:convert';

import 'package:eva2_flutter/models/card_proveedor.dart';

class ProveedorResponse {
  ProveedorResponse({
    required this.proveedores,
  });

  List<CardProveedor> proveedores;

  factory ProveedorResponse.fromJson(String str) =>
      ProveedorResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProveedorResponse.fromMap(Map<String, dynamic> json) => ProveedorResponse(
        proveedores: List<CardProveedor>.from(
            json["proveedores"].map((x) => CardProveedor.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "proveedores": List<dynamic>.from(proveedores.map((x) => x.toMap())),
      };
}
