import 'dart:convert';

class CardProveedor {
  CardProveedor({
    required this.id,
    required this.proveedorId,
    required this.fecha,
    required this.product,
    required this.total,
    required this.categoria,
    required this.estado,
  });

  String id;
  int proveedorId;
  String fecha;
  String product;
  String total;
  String categoria;
  String estado;

  factory CardProveedor.fromJson(String str) =>
      CardProveedor.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CardProveedor.fromMap(Map<String, dynamic> json) => CardProveedor(
        id: json["_id"],
        proveedorId: json["proveedorId"],
        fecha: json["fecha"],
        product: json["product"],
        total: json["total"],
        categoria: json["categoria"],
        estado: json["estado"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "proveedorId": proveedorId,
        "fecha": fecha,
        "product": product,
        "total": total,
        "categoria": categoria,
        "estado": estado,
      };
}

// class CardProveedor {
//   CardProveedor({
//     required this.id,
//     required this.proveedorId,
//     required this.fecha,
//     required this.product,
//     required this.total,
//     required this.categoria,
//     required this.estado,
//   });

//   String id;
//   int proveedorId;
//   String fecha;
//   String product;
//   String total;
//   String categoria;
//   String estado;

//   factory CardProveedor.fromJson(String str) =>
//       CardProveedor.fromMap(json.decode(str));

//   String toJson() => json.encode(toMap());

//   factory CardProveedor.fromMap(Map<String, dynamic> json) => CardProveedor(
//         id: json["_id"],
//         proveedorId: json["proveedorId"],
//         fecha: json["fecha"],
//         product: json["product"],
//         total: json["total"],
//         categoria: json["categoria"],
//         estado: json["estado"],
//       );

//   Map<String, dynamic> toMap() => {
//         "_id": id,
//         "proveedorId": proveedorId,
//         "fecha": fecha,
//         "product": product,
//         "total": total,
//         "categoria": categoria,
//         "estado": estado,
//       };
// }
