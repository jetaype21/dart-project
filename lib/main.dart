import 'package:eva2_flutter/pages/cliente_form.dart';
import 'package:eva2_flutter/pages/product_form.dart';
import 'package:eva2_flutter/pages/proveedor_form.dart';
import 'package:eva2_flutter/pages/reporte_clientes_screen.dart';
import 'package:eva2_flutter/pages/reporte_productos_screen.dart';
import 'package:eva2_flutter/pages/reporte_proveedor_screen.dart';
import 'package:eva2_flutter/providers/proveedores_provider.dart';
import 'package:flutter/material.dart';
import 'package:eva2_flutter/pages/about_page.dart';
import 'package:eva2_flutter/pages/home_page.dart';
import 'package:eva2_flutter/pages/pedido_form_screen.dart';
import 'package:eva2_flutter/pages/suggestion_page.dart';
import 'package:eva2_flutter/providers/client_provider.dart';
import 'package:eva2_flutter/providers/productos_provider.dart';
import 'package:eva2_flutter/pages/clientesPage.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /* return MaterialApp(
        title: 'Sneake Store',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const HomePage(),
          '/sports': (context) => const SportPage(),
          '/street': (context) => const StreetPage(),
          '/collection': (context) => const CollectionPage(),
          '/about': (context) => const AboutPage(),
          '/suggestions': (context) => const SuggestionPage(),
        }); */
    return MultiProvider(
      providers: [
      ChangeNotifierProvider(create: (_) => ClientesProvider()),
      ChangeNotifierProvider(create: (_) => ProductosProvider()),
      ChangeNotifierProvider(create: (_) => ProveedoresProvider()),
      ],
      child: MaterialApp(
        title: 'Sneake Store',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const HomePage(),
          '/clientes': (context) => const ClientesPage(),
          '/about': (context) => const AboutPage(),
          '/suggestions': (context) => const SuggestionPage(),
          '/cliente_form': (context) => const ClienteForm(),
          '/proveedor_form': (context) => const ProveedorForm(),
          '/producto_form': (context) => const ProductForm(),
          '/resportesproveedor': (context) => const ReporteProveedoresScreen(),
          '/resportesclientes': (context) => const ReporteClientesScreen(),
          '/resportesproductos': (context) => const ReporteProductosScreen(),
        }),
    );
  }
}
