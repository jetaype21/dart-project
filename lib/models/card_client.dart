import 'dart:convert';

class CardCliente {
  CardCliente({
    required this.id,
    required this.clienteId,
    required this.fecha,
    required this.product,
    required this.total,
    required this.categoria,
    required this.estado,
  });

  String id;
  int clienteId;
  String fecha;
  String product;
  String total;
  String categoria;
  String estado;

  factory CardCliente.fromJson(String str) => CardCliente.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CardCliente.fromMap(Map<String, dynamic> json) => CardCliente(
        id: json["_id"],
        clienteId: json["clienteId"],
        fecha: json["fecha"],
        product: json["product"],
        total: json["total"],
        categoria: json["categoria"],
        estado: json["estado"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "clienteId": clienteId,
        "fecha": fecha,
        "product": product,
        "total": total,
        "categoria": categoria,
        "estado": estado,
      };
}
