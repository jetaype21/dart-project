import 'package:flutter/material.dart';
import 'package:eva2_flutter/models/card_client.dart';
import 'package:eva2_flutter/providers/client_provider.dart';
import 'package:provider/provider.dart';

class ClienteForm extends StatefulWidget {
  const ClienteForm({super.key});

  @override
  State<ClienteForm> createState() => _ClienteFormState();
}

enum Categorias { nike, jordan, adidas }

class _ClienteFormState extends State<ClienteForm> {
  final _formKeyC = GlobalKey<FormState>();
  final txtclienteId = TextEditingController();
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
      txtclienteId.dispose();
      super.dispose();
    }

    // OBTENIENDO EL PEDIDO COMO ARGUMENTO DE PEDIDO_SCREEN
    final CardCliente? cardCliente =
        ModalRoute.of(context)!.settings.arguments as CardCliente?;
    if (!formModificado) {
      if (cardCliente != null) {
        txtclienteId.text = cardCliente.clienteId.toString();
        txtproduct.text = cardCliente.product;
        txtfecha.text = cardCliente.fecha;
        txttotal.text = cardCliente.total;

        if (cardCliente.categoria == 'Categorias.adidas') {
          _catSeleccion = Categorias.adidas;
        }

        if (cardCliente.categoria == 'Categorias.jordan') {
          _catSeleccion = Categorias.jordan;
        }

        if (cardCliente.categoria == 'Categorias.nike') {
          _catSeleccion = Categorias.nike;
        }

        _estadoActivado = cardCliente.estado == "true" ? true : false;
      } else {
        txtclienteId.text = '0';
      }
    }
    // PedidoLocal pedidoLocal = PedidoLocal();
    final clientProvider = Provider.of<ClientesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('CLIENTE FORM'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKeyC,
          child: Column(
            children: <Widget>[
              TextFormField(
                  decoration: InputDecoration(
                      labelText: 'CLIENTE',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0))),
                  controller: txtclienteId),
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
                  }),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                  decoration: InputDecoration(
                      labelText: 'FECHA',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0))),
                  controller: txtfecha,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Por favor ingrese una Fecha";
                    }
                  }),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Total',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0))),
                  controller: txttotal,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Por favor ingrese una cantidad";
                    }
                  }),
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
                  var cardClient = CardCliente(
                    id: '',
                    clienteId: int.parse(txtclienteId.text),
                    product: txtproduct.text,
                    fecha: txtfecha.text,
                    total: txttotal.text,
                    categoria: _catSeleccion.toString(),
                    estado: _estadoActivado.toString(),
                  );

                  clientProvider.postSaveClient(cardClient);

                  Navigator.pushReplacementNamed(context, '/clientes');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
