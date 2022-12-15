import 'package:eva2_flutter/models/card_client.dart';
import 'package:eva2_flutter/models/card_proveedor.dart';
import 'package:flutter/material.dart';

class ProveedorSearchDelegate extends SearchDelegate<CardProveedor> {
  final List<CardProveedor> listaProveedores;
  ProveedorSearchDelegate(this.listaProveedores);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.backspace))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(
            context,
            CardProveedor(
                id: '',
                categoria: '',
                estado: '',
                fecha: '',
                product: '',
                proveedorId: 0,
                total: ''));
      },
      icon: Icon(Icons.arrow_back_ios),
      color: Colors.blueGrey,
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final listaFiltrada = query.isEmpty
        ? listaProveedores
        : listaProveedores
            .where(((proveedor) =>
                proveedor.product.toLowerCase().contains((query.toLowerCase()))))
            .toList();
    return ListView.builder(
      itemCount: listaFiltrada.length,
      itemBuilder: (BuildContext context, index) {
        return _cardProveedor(listaFiltrada[index], context);
      },
    );
  }

  Widget _cardProveedor(CardProveedor proveedorFiltrado, context) {
    return Card(
      child: Column(children: <Widget>[
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage('https://picsum.photos/200/300'),
          ),
          title: Text(proveedorFiltrado.product),
          subtitle: Text(
            proveedorFiltrado.fecha,
          ),
          onTap: () {
            Navigator.pushNamed(context, '/proveedor_form',
                arguments: proveedorFiltrado);
          },
        )
      ]),
    );
  }
}
