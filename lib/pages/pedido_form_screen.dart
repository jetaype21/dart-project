import 'package:flutter/material.dart';
import 'package:eva2_flutter/models/card_client.dart';
import 'package:eva2_flutter/providers/client_provider.dart';
import 'package:provider/provider.dart';

class PedidoFormScreen extends StatefulWidget {
  const PedidoFormScreen({super.key});

  @override
  State<PedidoFormScreen> createState() => _PedidoFormScreenState();
}

class _PedidoFormScreenState extends State<PedidoFormScreen> {
 

  @override
  Widget build(BuildContext context) {
    final txtclientId = TextEditingController();
    final txtproduct = TextEditingController();
    final txtfecha = TextEditingController();
    final txttotal = TextEditingController();
    
 @override
  void dispose() {
    // Limpia el controlador cuando el widget se elimine del árbol de widgets
  txtclientId.dispose();
    super.dispose();
  }

    // OBTENIENDO EL PEDIDO COMO ARGUMENTO DE PEDIDO_SCREEN
    final CardCliente? cardClient =
        ModalRoute.of(context)!.settings.arguments as CardCliente?;

    if (cardClient != null) {
      txtclientId.text = cardClient.clienteId.toString();
      txtproduct.text = cardClient.product;
      txtfecha.text = cardClient.fecha;
      txttotal.text = cardClient.total;
    } else {
      txtclientId.text = '0';
    }

    // PedidoLocal pedidoLocal = PedidoLocal();
    final clientProvider = Provider.of<ClientesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('PEDIDO FORM'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          // key: ,
          child: Column(
            children: <Widget>[
              TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Producto',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0))),
                  controller: txtclientId),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Producto',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0))),
                  controller: txtproduct),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                  decoration: InputDecoration(
                      labelText: 'FECHA',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0))),
                  controller: txtfecha),
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
              ElevatedButton(
                child: const Text('GUARDAR'),
                onPressed: () {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text('Guardando')));
                  // CUANDO ES NUEVO
                  var cardClient = CardCliente(
                      id: '',
                      clienteId: 0,
                      product: txtproduct.text,
                      fecha: txtfecha.text,
                      total: txttotal.text);

                  // clientProvider.postSavePedido(cardClient);

                  // AGREGANDO PEDIDO A LA LISTA
                  /* if (int.parse(txtId.text) == 0) {
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
                  }*/

                  Navigator.pushReplacementNamed(context, '/about');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
