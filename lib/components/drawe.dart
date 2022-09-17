// ignore: non_constant_identifier_names
  import 'package:flutter/material.dart';

DrawerHeader DrawHeaderWidget(BuildContext context) {
    return DrawerHeader(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          image: DecorationImage(
              image: AssetImage('assets/imgMenu.jpg'), fit: BoxFit.cover)),
      child: Align(
          alignment: Alignment.bottomRight,
          child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const CircleAvatar(
                backgroundColor: Colors.white,
                // ignore: unnecessary_const
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  // size: 44,
                ),
              ))),
    );
  }