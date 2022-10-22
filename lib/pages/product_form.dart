import 'package:eva2_flutter/models/card_product.dart';
import 'package:eva2_flutter/providers/productos_provider.dart';
import 'package:flutter/material.dart';
import 'package:eva2_flutter/models/card_client.dart';
import 'package:eva2_flutter/providers/client_provider.dart';
import 'package:provider/provider.dart';

class ProductForm extends StatefulWidget {
  const ProductForm({super.key});

  @override
  State<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  @override
  Widget build(BuildContext context) {
    final txtproductoId = TextEditingController();
    final txtprecio = TextEditingController();
    final txtprecioInitial = TextEditingController();
    final txtname = TextEditingController();
    final txtimg = TextEditingController();

    @override
    void dispose() {
      // Limpia el controlador cuando el widget se elimine del árbol de widgets
      txtproductoId.dispose();
      super.dispose();
    }

    // OBTENIENDO EL PEDIDO COMO ARGUMENTO DE PEDIDO_SCREEN
    final CardProduct? cardProduct =
        ModalRoute.of(context)!.settings.arguments as CardProduct?;

    if (cardProduct != null) {
      txtproductoId.text = cardProduct.productoId.toString();
      txtprecio.text = cardProduct.precio;
      txtprecioInitial.text = cardProduct.precioInitial;
      txtname.text = cardProduct.name;
      txtimg.text = cardProduct.img;
    } else {
      txtproductoId.text = '0';
    }

    // PedidoLocal pedidoLocal = PedidoLocal();
    final productosProvider = Provider.of<ProductosProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('PRODUCTO FORM'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          // key: ,
          child: Column(
            children: <Widget>[
              TextFormField(
                  decoration: InputDecoration(
                      labelText: 'productoid',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0))),
                  controller: txtproductoId),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                  decoration: InputDecoration(
                      labelText: 'precio',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0))),
                  controller: txtprecio),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                  decoration: InputDecoration(
                      labelText: 'precio Inicial',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0))),
                  controller: txtprecioInitial),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                  decoration: InputDecoration(
                      labelText: 'name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0))),
                  controller: txtname),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Imagen',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                controller: txtimg,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                child: const Text('GUARDAR'),
                onPressed: () {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text('Guardando')));
                  // CUANDO ES NUEVO
                  var cardProducto = CardProduct(
                    id: '',
                    productoId: 0,
                    precio: txtprecio.text,
                    precioInitial: txtprecioInitial.text,
                    name: txtname.text,
                    img: txtimg.text,
                  );

                  productosProvider.postSaveProducto(cardProducto);

                  // AGREGANDO PEDIDO A LA LISTA
                  /*  if (int.parse(txtId.text) == 0) {
                    // OSEA NUEVO
                   pedidoLocal.agregarPedidoItem(Pedido(
                        id: pedidoLocal.obtenerCantidadPedidos() + 1,
                        descripcion: txtDescripcion.text,
                        fecha: txtFecha.text,
                        imagen: txtImagen.text));
                  } else {
                    // OSEA EDITAR
                    pedidoLocal.editarPedidoItem(Pedido(
                        id: int.parse(txtId.text),
                        descripcion: txtDescripcion.text,
                        fecha: txtFecha.text,
                        imagen: txtImagen.text));
                  } */

                  Navigator.pushReplacementNamed(context, '/');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
