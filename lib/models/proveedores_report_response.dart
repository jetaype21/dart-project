// To parse this JSON data, do
//
//     final proveedoesReportResponse = proveedoesReportResponseFromMap(jsonString);

import 'dart:convert';

import 'package:eva2_flutter/models/proveedorReport.dart';

class ProveedoesReportResponse {
  ProveedoesReportResponse({
    required this.proveedoresReport,
  });

  List<ProveedoresReport> proveedoresReport;

  factory ProveedoesReportResponse.fromJson(String str) =>
      ProveedoesReportResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProveedoesReportResponse.fromMap(Map<String, dynamic> json) =>
      ProveedoesReportResponse(
        proveedoresReport: List<ProveedoresReport>.from(
            json["proveedoresReport"].map((x) => ProveedoresReport.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "proveedoresReport":
            List<dynamic>.from(proveedoresReport.map((x) => x.toMap())),
      };
}
