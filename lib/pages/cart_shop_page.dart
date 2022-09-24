import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project_final/components/background_container.dart';
import 'package:project_final/data/data_home_local.dart';
import 'package:project_final/models/card_item.dart';
import 'package:project_final/models/card_shopItem.dart';

class CartShopPage extends StatefulWidget {
  const CartShopPage({super.key});

  @override
  State<CartShopPage> createState() => _CartShopPageState();
}

class _CartShopPageState extends State<CartShopPage> {
  DataHomeLocal dataHomeLocal = DataHomeLocal();
  @override
  Widget build(BuildContext context) {
    final List<CardShopItem> listShopItems = DataHomeLocal.listShopItems;

    return Scaffold(
      appBar: AppBar(title: Text('Tus compras')),
      body: ListView(
        children: [
          for (final item in listShopItems)
            // SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(colors: [
                    Colors.grey,
                    Colors.grey,
                  ])),
              child: Column(children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(item.img),
                          ),
                          Text('${item.name}', style: TextStyle(color: Colors.white, fontSize: 26)),
                          IconButton(
                              onPressed: (() => setState(() {
                                    dataHomeLocal.addCantItem(item.id);
                                    dataHomeLocal = DataHomeLocal();
                                    dataHomeLocal.priceProducts(
                                        item.cant, item.id);
                                  })),
                              icon: Icon(Icons.add, color: Colors.blue,size: 35,))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          
                             Text(
                              '${item.cant} ',
                              style: TextStyle(
                                  // backgroundColor: Colors.blueAccent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 26,
                                  color: Colors.white),
                            ),
                          
                          Text('s/: ${item.precio}', style: TextStyle(color: Colors.white, fontSize: 28)),
                          IconButton(
                              onPressed: (() => setState(() {
                                    dataHomeLocal.removeItem(item.id);
                                    dataHomeLocal = DataHomeLocal();
                                    dataHomeLocal.priceProducts(
                                        item.cant, item.id);
                                  })),
                              icon: Icon(Icons.remove, color: Colors.red,size: 35,)),

                        ],
                      ),
                    ],
                  ),
                )
              ]),
            )
        ],
      ),
    );
  }
}
