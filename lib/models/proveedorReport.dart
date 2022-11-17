import 'dart:convert';

class ProveedoresReport {
  ProveedoresReport({
    required this.id,
    required this.count,
  });

  String id;
  int count;

  factory ProveedoresReport.fromJson(String str) =>
      ProveedoresReport.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProveedoresReport.fromMap(Map<String, dynamic> json) =>
      ProveedoresReport(
        id: json["_id"],
        count: json["count"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "count": count,
      };
}
