import 'dart:convert';


class ProductosReport {
  ProductosReport({
    required this.id,
    required this.count,
  });

  String id;
  int count;

  factory ProductosReport.fromJson(String str) =>
      ProductosReport.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductosReport.fromMap(Map<String, dynamic> json) => ProductosReport(
        id: json["_id"],
        count: json["count"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "count": count,
      };
}
