import 'package:eva2_flutter/models/card_proveedor.dart';
import 'package:eva2_flutter/providers/proveedores_provider.dart';
import 'package:flutter/material.dart';
import 'package:eva2_flutter/models/card_client.dart';
import 'package:eva2_flutter/providers/client_provider.dart';
import 'package:provider/provider.dart';

class ProveedorForm extends StatefulWidget {
  const ProveedorForm({super.key});

  @override
  State<ProveedorForm> createState() => _ProveedorFormState();
}

enum Categorias { nike, jordan, adidas }

class _ProveedorFormState extends State<ProveedorForm> {
  final _formKey = GlobalKey<FormState>();
  final txtproveedorId = TextEditingController();
  final txtproduct = TextEditingController();
  final txtfecha = TextEditingController();
  final txttotal = TextEditingController();
  Categorias? _catSeleccion = Categorias.adidas;
  bool? _estadoActivado = false;
  bool formModificado = false;

  @override
  Widget build(BuildContext context) {
    @override
    void dispose() {
      // Limpia el controlador cuando el widget se elimine del árbol de widgets
      txtproveedorId.dispose();
      super.dispose();
    }

    // OBTENIENDO EL PEDIDO COMO ARGUMENTO DE PEDIDO_SCREEN
    final CardProveedor? cardProveedor =
        ModalRoute.of(context)!.settings.arguments as CardProveedor?;

    if (!formModificado) {
      if (cardProveedor != null) {
        txtproveedorId.text = cardProveedor.proveedorId.toString();
        txtproduct.text = cardProveedor.product;
        txtfecha.text = cardProveedor.fecha;
        txttotal.text = cardProveedor.total;

        if (cardProveedor.categoria == 'Categorias.adidas') {
          _catSeleccion = Categorias.adidas;
        }

        if (cardProveedor.categoria == 'Categorias.jordan') {
          _catSeleccion = Categorias.jordan;
        }

        if (cardProveedor.categoria == 'Categorias.nike') {
          _catSeleccion = Categorias.nike;
        }

        _estadoActivado = cardProveedor.estado == "true" ? true : false;
      } else {
        txtproveedorId.text = '0';
      }
    }

    // PedidoLocal pedidoLocal = PedidoLocal();
    final proveedoresProvider = Provider.of<ProveedoresProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('PROVEDOR FORM'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                  decoration: InputDecoration(
                      labelText: 'PROVEDOR',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0))),
                  controller: txtproveedorId),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Producto',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                controller: txtproduct,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Por favor ingrese un producto";
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Fecha',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                controller: txtfecha,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Ingrese una fecha.";
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Total',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                controller: txttotal,
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
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Guardando')));
                      // CUANDO ES NUEVO
                      var cardProveedor = CardProveedor(
                        id: '',
                        proveedorId: int.parse(txtproveedorId.text),
                        product: txtproduct.text,
                        fecha: txtfecha.text,
                        total: txttotal.text,
                        categoria: _catSeleccion.toString(),
                        estado: _estadoActivado.toString(),
                      );

                      proveedoresProvider.postSaveProveedor(cardProveedor);
                      Navigator.pushReplacementNamed(context, '/suggestions');
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
