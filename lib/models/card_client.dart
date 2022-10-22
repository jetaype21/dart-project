import 'dart:convert';

class CardCliente {
  CardCliente({
    required this.id,
    required this.clienteId,
    required this.fecha,
    required this.product,
    required this.total,
  });

  String id;
  int clienteId;
  String fecha;
  String product;
  String total;

  factory CardCliente.fromJson(String str) => CardCliente.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CardCliente.fromMap(Map<String, dynamic> json) => CardCliente(
        id: json["_id"],
        clienteId: json["clienteId"],
        fecha: json["fecha"],
        product: json["product"],
        total: json["total"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "clienteId": clienteId,
        "fecha": fecha,
        "product": product,
        "total": total,
      };
}
