import 'dart:convert';

class CardProduct {
  CardProduct({
    required this.id,
    required this.productoId,
    required this.precio,
    required this.precioInitial,
    required this.name,
    required this.img,
    required this.categoria,
    required this.estado,
  });

  String id;
  int productoId;
  String precio;
  String precioInitial;
  String name;
  String img;
  String categoria;
  String estado;

  factory CardProduct.fromJson(String str) =>
      CardProduct.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CardProduct.fromMap(Map<String, dynamic> json) => CardProduct(
        id: json["_id"],
        productoId: json["productoId"],
        precio: json["precio"],
        precioInitial: json["precioInitial"],
        name: json["name"],
        img: json["img"],
        categoria: json["categoria"],
        estado: json["estado"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "productoId": productoId,
        "precio": precio,
        "precioInitial": precioInitial,
        "name": name,
        "img": img,
        "categoria": categoria,
        "estado": estado,
      };
}
