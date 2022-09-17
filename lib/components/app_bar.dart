import 'package:flutter/material.dart';

AppBar MyAppBar() {
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
          onPressed: () {},
          icon: const Icon(
            Icons.search,
            color: Colors.white,
            size: 36,
          ))
    ],
  );
}
