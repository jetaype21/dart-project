import 'package:card_swiper/card_swiper.dart';
import 'package:eva2_flutter/search/cliente_search_delegate.dart';
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
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Nuestros ultimos clientes'),
        elevation: 0,
        actions: <Widget>[
          IconButton(
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: ClienteSearchDelegate(listDataClientes));
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: Container(
          width: double.infinity,
          height: size.height * 0.7,
          color: Colors.blueAccent,
          child: Swiper(
            itemCount: listDataClientes.length,
            layout: SwiperLayout.STACK,
            itemWidth: size.width * 0.8,
            itemHeight: size.height * 0.8,
            itemBuilder: ((BuildContext context, index) {
              return _cardCliente(listDataClientes[index]);
            }),
          ))

      //                     IconButton(
      //                         onPressed: () {
      //                           Navigator.pushNamed(context, '/cliente_form',
      //                               arguments: item);
      //                         },
      //                         icon: Icon(Icons.arrow_right))
      //                   ],
      //                 ),
      //               ],
      //             ),
      //           )
      //         ]),
      //       )
      //   ],
      // ),
      ,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/cliente_form');
        },
        backgroundColor: Colors.red[400],
      ),
    );
  }
}

class _cardCliente extends StatelessWidget {
  final CardCliente cliente;

  _cardCliente(this.cliente);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.all(23.0),
      width: double.infinity,
      height: size.height * 0.5,
      decoration: _cardBorders(),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [_ImagenFondo(cliente), _EtiquetaProducto(cliente)],
      ),
    );
  }
}

class _EtiquetaProducto extends StatelessWidget {
  final CardCliente cliente;
  _EtiquetaProducto(this.cliente);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(23.0),
      ),
      child: ListTile(
        title: Text(
          cliente.product,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue),
        ),
        subtitle: Text(cliente.fecha,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.green)),
        trailing: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cliente_form', arguments: cliente);
            },
            icon: Icon(Icons.edit)),
      ),
    );
  }
}

class _ImagenFondo extends StatelessWidget {
  final CardCliente cliente;

  _ImagenFondo(this.cliente);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: double.infinity,
        height: 400,
        child: FadeInImage(
          placeholder: NetworkImage(
              'https://images.unsplash.com/photo-1529533608-0cccb90f390a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fGNsaWVudGUlMjBhbm9uaW1vfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60'),
          image: NetworkImage('https://picsum.photos/200/300'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

BoxDecoration _cardBorders() => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
              color: Colors.lightBlueAccent,
              offset: Offset(0, 10),
              blurRadius: 10)
        ]);
