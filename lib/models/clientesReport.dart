import 'dart:convert';

class ClientesReport {
  ClientesReport({
    required this.id,
    required this.count,
  });

  String id;
  int count;

  factory ClientesReport.fromJson(String str) =>
      ClientesReport.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ClientesReport.fromMap(Map<String, dynamic> json) => ClientesReport(
        id: json["_id"],
        count: json["count"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "count": count,
      };
}
