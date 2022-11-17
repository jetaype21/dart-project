import 'dart:convert';

import 'package:eva2_flutter/models/ProductosReport.dart';

class ProductosReportResponse {
  ProductosReportResponse({
    required this.productosReport,
  });

  List<ProductosReport> productosReport;

  factory ProductosReportResponse.fromJson(String str) =>
      ProductosReportResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductosReportResponse.fromMap(Map<String, dynamic> json) =>
      ProductosReportResponse(
        productosReport: List<ProductosReport>.from(
            json["productosReport"].map((x) => ProductosReport.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "productosReport":
            List<dynamic>.from(productosReport.map((x) => x.toMap())),
      };
}
