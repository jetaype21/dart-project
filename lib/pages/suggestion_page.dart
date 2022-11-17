import 'package:eva2_flutter/models/card_proveedor.dart';
import 'package:eva2_flutter/providers/productos_provider.dart';
import 'package:eva2_flutter/providers/proveedores_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SuggestionPage extends StatefulWidget {
  const SuggestionPage({super.key});

  @override
  State<SuggestionPage> createState() => _SuggestionPageState();
}

class _SuggestionPageState extends State<SuggestionPage> {
  // List<CardProvedor> listProvedor = DataProovedor.listProvedor;

  @override
  Widget build(BuildContext context) {
    final clientProvider = Provider.of<ProveedoresProvider>(context);
    final List<CardProveedor> listDataProveedores = clientProvider.proveedores;

    return Scaffold(
      appBar: AppBar(
        title: Text('Nuestros ultimos Proveedores'),
      ),
      body: ListView(
        children: [
          for (final item in listDataProveedores)
            // SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(colors: [
                    Colors.grey,
                    Colors.grey,
                  ])),
              child: Column(children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${item.fecha}',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 26)),
                          Text('${item.product}',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 26)),
                          Text('Total: ${item.total}',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 26)),
                          IconButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/proveedor_form', arguments: item);
                              },
                              icon: Icon(Icons.arrow_right))
                        ],
                      ),
                    ],
                  ),
                )
              ]),
            )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          agregarProveedor();
        },
        backgroundColor: Colors.red[400],
      ),
    );
  }

  void agregarProveedor() {
    Navigator.pushNamed(context, '/proveedor_form');
    /*
    return setState(() {
            listaPedidos.insert(0,
                Pedido(id: 3, descripcion: 'PEDIDO 3', fecha: '03/09/2022'));
          });
    */
  }
}
