import 'package:flutter/material.dart';
import 'package:project_final/pages/cart_shop_page.dart';

AppBar MyAppBar(context) {
  return AppBar(
    backgroundColor: const Color.fromARGB(255, 1, 12, 37),
    leading: Builder(builder: (BuildContext context) {
      return IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          icon: const Icon(
            Icons.notes_sharp,
            color: Colors.white,
            size: 36,
          ));
    }),
    title: const Text(''),
    actions: [
      IconButton(
          onPressed: () {
            Navigator.push((context),
                MaterialPageRoute(builder: (context) => const CartShopPage()));
            // Navigator.push(context, MaterialPageRoute(builder: builder))
          },
          icon: const Icon(
            Icons.shopping_cart,
            color: Colors.white,
            size: 36,
          ))
    ],
  );
}
