import 'package:eva2_flutter/models/card_client.dart';
import 'package:flutter/material.dart';

class ClienteSearchDelegate extends SearchDelegate<CardCliente> {
  final List<CardCliente> listaClientes;
  ClienteSearchDelegate(this.listaClientes);

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
            CardCliente(
                id: '',
                clienteId: 0,
                fecha: '',
                product: '',
                total: '',
                categoria: '',
                estado: ''));
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
        ? listaClientes
        : listaClientes
            .where(((cliente) =>
                cliente.product.toLowerCase().contains((query.toLowerCase()))))
            .toList();
    return ListView.builder(
      itemCount: listaFiltrada.length,
      itemBuilder: (BuildContext context, index) {
        return _cardCliente(listaFiltrada[index], context);
      },
    );
  }

  Widget _cardCliente(CardCliente clienteFiltrado, context) {
    return Card(
      child: Column(children: <Widget>[
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage('https://picsum.photos/200/300'),
          ),
          title: Text(clienteFiltrado.product),
          subtitle: Text(
            clienteFiltrado.fecha,
          ),
          onTap: () {
            Navigator.pushNamed(context, '/cliente_form',
                arguments: clienteFiltrado);
          },
        )
      ]),
    );
  }
}
