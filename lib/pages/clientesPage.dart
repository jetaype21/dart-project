import 'package:flutter/material.dart';
import 'package:eva2_flutter/models/card_client.dart';
import 'package:eva2_flutter/providers/client_provider.dart';
import 'package:provider/provider.dart';

class ClientesPage extends StatefulWidget {
  const ClientesPage({super.key});

  @override
  State<ClientesPage> createState() => _ClientesPageState();
}

class _ClientesPageState extends State<ClientesPage> {
  @override
  Widget build(BuildContext context) {
    
    final clientesProvider = Provider.of<ClientesProvider>(context);
    final List<CardCliente> listDataClientes = clientesProvider.clientes;

    return Scaffold(
      appBar: AppBar(
        title: Text('Nuestros ultimos clientes'),
      ),
      body: ListView(
        children: [
          for (final item in listDataClientes)
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
                        ],
                      ),
                    ],
                  ),
                )
              ]),
            )
        ],
      )
      ,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          agregarCliente();
        },
        backgroundColor: Colors.red[400],
      ),
    );
  }

  void agregarCliente() {
    Navigator.pushNamed(context, '/cliente_form');
    /*
    return setState(() {
            listaPedidos.insert(0,
                Pedido(id: 3, descripcion: 'PEDIDO 3', fecha: '03/09/2022'));
          });
    */
  }
}
