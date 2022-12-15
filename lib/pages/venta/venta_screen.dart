import 'package:eva2_flutter/models/card_client.dart';
import 'package:eva2_flutter/models/card_product.dart';
import 'package:eva2_flutter/providers/client_provider.dart';
import 'package:eva2_flutter/providers/productos_provider.dart';
import 'package:eva2_flutter/views/sidebar_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VentaScreen extends StatefulWidget {
  const VentaScreen({super.key});

  @override
  State<VentaScreen> createState() => _VentaScreenState();
}

class _VentaScreenState extends State<VentaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                title: Text("ventas"),
                bottom: TabBar(tabs: [
                  Tab(icon: Icon(Icons.home)),
                  Tab(icon: Icon(Icons.directions_transit)),
                  Tab(icon: Icon(Icons.directions_bike)),
                ]),
              ),
              drawer: SidebarMenu(),
              body: TabBarView(children: [
                _TabVenta(),
                Icon(Icons.directions_transit),
                Icon(Icons.directions_bike)
              ]),
            )));
  }
}

class _TabVenta extends StatefulWidget {
  _TabVenta({super.key});

  @override
  State<_TabVenta> createState() => _TabVentaState();
}

class _TabVentaState extends State<_TabVenta> {
  final _formKey = GlobalKey<FormState>();
  var dbProduct;
  final txtCantidad = TextEditingController();
  final txtPrecio = TextEditingController();
  var txtTotal = 0;

  @override
  Widget build(BuildContext context) {
    final productosProvider = Provider.of<ProductosProvider>(context);
    final clientesProvider = Provider.of<ClientesProvider>(context);
    final List<CardProduct> listaProductos = productosProvider.listProductos;

    return Container(
      padding: EdgeInsets.all(20.0),
      child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              const Text("Formulario de venta"),
              const SizedBox(
                height: 20,
              ),
              DropdownButtonFormField(
                decoration: InputDecoration(
                    labelText: "Cliente", border: OutlineInputBorder()),
                value: listaProductos[0].productoId,
                // value: listaProductos[0],
                items: listaProductos.map((producto) {
                  return DropdownMenuItem(
                      value: producto.productoId,
                      child: Row(
                        children: <Widget>[
                          Image.network(
                            producto.img,
                            width: 50,
                            height: 50,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(producto.name)
                        ],
                      ));
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    dbProduct = value;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: txtCantidad,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'cantidad', border: OutlineInputBorder()),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'ingrese un cantidad';
                  }

                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    txtTotal =
                        int.parse(txtCantidad.text) * int.parse(txtPrecio.text);
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: txtPrecio,
                decoration: InputDecoration(
                    labelText: 'precio', border: OutlineInputBorder()),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'ingrese un precio';
                  }

                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    txtTotal =
                        int.parse(txtCantidad.text) * int.parse(txtPrecio.text);
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              Text('Total: $txtTotal'),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text("vendiendo")));
                    }

                    print( listaProductos[dbProduct].categoria);
                    var cliente = CardCliente(
                        id: '',
                        clienteId: 0,
                        categoria: listaProductos[dbProduct].categoria,
                        estado: listaProductos[dbProduct].estado,
                        product: listaProductos[dbProduct].name,
                        fecha: '17/12/22',
                        total: txtTotal.toString());
                    clientesProvider.postSaveClient(cliente);
                  },
                  child: Text("Vender")),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(onPressed: () {}, child: Text("nueva venta")),
            ],
          )),
    );
  }
}
