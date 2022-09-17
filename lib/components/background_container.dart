import 'package:flutter/material.dart';

BoxDecoration BackgroundInContainer() {
    return const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 2, 19, 30),
          Color.fromARGB(255, 1, 12, 37),
        ], begin: Alignment.topLeft, end: Alignment.bottomRight));
  }