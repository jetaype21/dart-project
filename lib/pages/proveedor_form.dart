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

class _ProveedorFormState extends State<ProveedorForm> {
  @override
  Widget build(BuildContext context) {
    final txtproveedorId = TextEditingController();
    final txtproduct = TextEditingController();
    final txtfecha = TextEditingController();
    final txttotal = TextEditingController();

    @override
    void dispose() {
      // Limpia el controlador cuando el widget se elimine del árbol de widgets
      txtproveedorId.dispose();
      super.dispose();
    }

    // OBTENIENDO EL PEDIDO COMO ARGUMENTO DE PEDIDO_SCREEN
    final CardProveedor? cardProveedor =
        ModalRoute.of(context)!.settings.arguments as CardProveedor?;

    if (cardProveedor!= null) {
      txtproveedorId.text = cardProveedor.proveedorId.toString();
      txtproduct.text = cardProveedor.product;
      txtfecha.text = cardProveedor.fecha;
      txttotal.text = cardProveedor.total;
    } else {
      txtproveedorId.text = '0';
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
          // key: ,
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
                  var cardProveedor = CardProveedor(
                      id: '',
                      proveedorId: 0,
                      product: txtproduct.text,
                      fecha: txtfecha.text,
                      total: txttotal.text);

                  proveedoresProvider.postSaveProveedor(cardProveedor);

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

                  Navigator.pushReplacementNamed(context, '/suggestions');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
