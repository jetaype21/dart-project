import 'dart:convert';

import 'package:eva2_flutter/models/card_product.dart';

class ProductosResponse {
  ProductosResponse({
    required this.productos,
  });

  List<CardProduct> productos;

  factory ProductosResponse.fromJson(String str) => ProductosResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductosResponse.fromMap(Map<String, dynamic> json) => ProductosResponse(
        productos: List<CardProduct>.from(
            json["productos"].map((x) => CardProduct.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "productos": List<dynamic>.from(productos.map((x) => x.toMap())),
      };
}
