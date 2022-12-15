import 'package:card_swiper/card_swiper.dart';
import 'package:eva2_flutter/models/card_proveedor.dart';
import 'package:eva2_flutter/providers/productos_provider.dart';
import 'package:eva2_flutter/providers/proveedores_provider.dart';
import 'package:eva2_flutter/search/proveedor_search_delegate.dart';
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
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Nuestros ultimos proveedores'),
        elevation: 0,
        actions: <Widget>[
          IconButton(
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: ProveedorSearchDelegate(listDataProveedores));
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: Container(
          width: double.infinity,
          height: size.height * 0.7,
          color: Colors.blueAccent,
          child: Swiper(
            itemCount: listDataProveedores.length,
            layout: SwiperLayout.STACK,
            itemWidth: size.width * 0.8,
            itemHeight: size.height * 0.8,
            itemBuilder: ((BuildContext context, index) {
              return _cardProveedor(listDataProveedores[index]);
            }),
          )),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/proveedor_form');
        },
        backgroundColor: Colors.red[400],
      ),
    );
  }
}

class _cardProveedor extends StatelessWidget {
  final CardProveedor proveedor;

  _cardProveedor(this.proveedor);

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
        children: [_ImagenFondo(proveedor), _EtiquetaProducto(proveedor)],
      ),
    );
  }
}

class _EtiquetaProducto extends StatelessWidget {
  final CardProveedor proveedor;
  _EtiquetaProducto(this.proveedor);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(23.0),
      ),
      child: ListTile(
        title: Text(
          proveedor.product,
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        subtitle: Text(proveedor.fecha,
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.red)),
        trailing: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cliente_form', arguments: proveedor);
            },
            icon: Icon(Icons.edit)),
      ),
    );
  }
}

class _ImagenFondo extends StatelessWidget {
  final CardProveedor proveedor;

  _ImagenFondo(this.proveedor);

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
