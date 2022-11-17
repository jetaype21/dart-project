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

enum Categorias { nike, jordan, adidas }

class _ProductFormState extends State<ProductForm> {
  final _formKeyP = GlobalKey<FormState>();
  final txtproductoId = TextEditingController();
  final txtprecio = TextEditingController();
  final txtprecioInitial = TextEditingController();
  final txtname = TextEditingController();
  final txtimg = TextEditingController();
  Categorias? _catSeleccion = Categorias.adidas;
  bool? _estadoActivado = false;
  bool formModificado = false;

  @override
  Widget build(BuildContext context) {
    @override
    void dispose() {
      // Limpia el controlador cuando el widget se elimine del árbol de widgets
      txtproductoId.dispose();
      super.dispose();
    }

    // OBTENIENDO EL PEDIDO COMO ARGUMENTO DE PEDIDO_SCREEN
    final CardProduct? cardProduct =
        ModalRoute.of(context)!.settings.arguments as CardProduct?;

    if (!formModificado) {
      if (cardProduct != null) {
        txtproductoId.text = cardProduct.productoId.toString();
        txtprecio.text = cardProduct.precio;
        txtprecioInitial.text = cardProduct.precioInitial;
        txtname.text = cardProduct.name;
        txtimg.text = cardProduct.img;

        if (cardProduct.categoria == 'Categorias.adidas') {
          _catSeleccion = Categorias.adidas;
        }

        if (cardProduct.categoria == 'Categorias.jordan') {
          _catSeleccion = Categorias.jordan;
        }

        if (cardProduct.categoria == 'Categorias.nike') {
          _catSeleccion = Categorias.nike;
        }

        _estadoActivado = cardProduct.estado == "true" ? true : false;
        
      } else {
        txtproductoId.text = '0';
      }
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
          key: _formKeyP,
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
                controller: txtprecio,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Por favor ingrese un precio";
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'precio Inicial',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                controller: txtprecioInitial,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Por favor ingrese un precio Inicial";
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                controller: txtname,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Por favor ingrese un nombre";
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Imagen',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                controller: txtimg,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Por favor ingrese una url";
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  const Text("CATEGORIA:"),
                  const SizedBox(
                    width: 20,
                  ),
                  Radio(
                      value: Categorias.adidas,
                      groupValue: _catSeleccion,
                      onChanged: (value) {
                        setState(() {
                          _catSeleccion = value as Categorias?;
                          formModificado = true;
                        });
                      }),
                  const Text("Adidas"),
                  const SizedBox(
                    width: 20,
                  ),
                  Radio(
                      value: Categorias.jordan,
                      groupValue: _catSeleccion,
                      onChanged: (value) {
                        setState(() {
                          _catSeleccion = value as Categorias?;
                          formModificado = true;
                        });
                      }),
                  const Text("Jordan"),
                  const SizedBox(
                    width: 20,
                  ),
                  Radio(
                      value: Categorias.nike,
                      groupValue: _catSeleccion,
                      onChanged: (value) {
                        setState(() {
                          _catSeleccion = value as Categorias?;
                          formModificado = true;
                        });
                      }),
                  const Text("Nike")
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  Text("ESTADO:"),
                  SizedBox(
                    width: 20,
                  ),
                  Checkbox(
                      value: _estadoActivado,
                      onChanged: (value) {
                        setState(() {
                          _estadoActivado = value;
                          formModificado = true;
                        });
                      }),
                  const Text("Activado")
                ],
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
                    productoId: int.parse(txtproductoId.text),
                    precio: txtprecio.text,
                    precioInitial: txtprecioInitial.text,
                    name: txtname.text,
                    img: txtimg.text,
                    categoria: _catSeleccion.toString(),
                    estado: _estadoActivado.toString(),
                  );

                  productosProvider.postSaveProducto(cardProducto);

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
