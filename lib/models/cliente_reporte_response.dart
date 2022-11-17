import 'dart:convert';

import 'package:eva2_flutter/models/clientesReport.dart';

class ClientessReportResponse {
  ClientessReportResponse({
    required this.clientesReport,
  });

  List<ClientesReport> clientesReport;

  factory ClientessReportResponse.fromJson(String str) =>
      ClientessReportResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ClientessReportResponse.fromMap(Map<String, dynamic> json) =>
      ClientessReportResponse(
        clientesReport: List<ClientesReport>.from(
            json["clientesReport"].map((x) => ClientesReport.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "clientesReport":
            List<dynamic>.from(clientesReport.map((x) => x.toMap())),
      };
}
