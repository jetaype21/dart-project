import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:eva2_flutter/components/drawe.dart';

class SidebarMenu extends StatefulWidget {
  const SidebarMenu({super.key});

  @override
  State<SidebarMenu> createState() => _SidebarMenuState();
}

class _SidebarMenuState extends State<SidebarMenu> {
  @override
  Widget build(BuildContext context) {

    List<_ListTileWidget> ListMenu = [
      const _ListTileWidget(
        icon: Icons.people_outline,
        text: 'Clientes',
        route: '/clientes',
      ),
      const _ListTileWidget(
        icon: Icons.mail_outline,
        text: 'Proveedores',
        route: '/suggestions',
      ),
      const _ListTileWidget(
        icon: Icons.mail_outline,
        text: 'Reportes Proveedor',
        route: '/resportesproveedor',
      ),
      const _ListTileWidget(
        icon: Icons.mail_outline,
        text: 'Reportes Clientes',
        route: '/resportesclientes',
      ),
      const _ListTileWidget(
        icon: Icons.mail_outline,
        text: 'Reportes productos',
        route: '/resportesproductos',
      ),
      const _ListTileWidget(
        icon: Icons.shop,
        text: 'Ventas',
        route: '/ventas',
      ),
    ];

    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 2, 19, 30),
          Color.fromARGB(255, 1, 12, 37)
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DrawHeaderWidget(context),
            for (int i = 0; i < ListMenu.length; i++) ListMenu[i],
          ],
        ),
      ),
    );
  }
}

class _ListTileWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  final String route;
  // ignore: non_constant_identifier_names
  final LetterSpace = 2.0;

  // ignore: unused_element
  const _ListTileWidget(
      {super.key, required this.text, required this.icon, required this.route});

  @override
  Widget build(BuildContext context) {
    var textFinal = text[0].toUpperCase() + text.substring(1);

    return ListTile(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      leading: Icon(
        icon,
        color: Colors.white,
        size: 19.0,
      ),
      title: Text(textFinal,
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            // letterSpacing: LetterSpace
          )),
    );
  }
}
