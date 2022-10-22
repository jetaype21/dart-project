import 'package:flutter/material.dart';
import 'package:eva2_flutter/components/app_bar.dart';
import 'package:eva2_flutter/components/background_container.dart';
import 'package:eva2_flutter/data/data_home_local.dart';
import 'package:eva2_flutter/models/card_product.dart';
import 'package:eva2_flutter/providers/productos_provider.dart';
import 'package:eva2_flutter/views/sidebar_menu.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final List<CardItem> listItemsSneakers = DataHomeLocal.listItemsSneakers;

  double width = 0.0;
  DataHomeLocal dataHomeLocal = DataHomeLocal();

  @override
  Widget build(BuildContext context) {
    final clientProvider = Provider.of<ProductosProvider>(context);
    final List<CardProduct> listDataProductos = clientProvider.listProductos;

    double widthPage = MediaQuery.of(context).size.width;
    width = widthPage;
    const textStyle = TextStyle(
        color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold);

    return Container(
        width: widthPage * 1,
        padding: const EdgeInsets.all(10),
        decoration: BackgroundInContainer(),
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            appBar: MyAppBar(context),
            drawer: const SidebarMenu(),
            body: ListView(
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text(
                                'BUY IN',
                                style: textStyle,
                              ),
                              Text(
                                'PERUVIAN',
                                style: textStyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                    padding: EdgeInsets.only(left: 10),
                    height: 250,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: listDataProductos.length,
                        itemBuilder: ((context, index) =>
                            CardItemWidget(listDataProductos[index])),
                        separatorBuilder: (BuildContext context, int index) =>
                            SizedBox(width: 10)))
              ],
            )
            ,
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, '/producto_form');
            },
            backgroundColor: Colors.red[400],
          ),

            ));
            
  }

  Container CardItemWidget(CardProduct item) => Container(
        width: width * 0.9,
        height: 250,
        color: Colors.transparent,
        child: Column(
          children: [
            Expanded(
                child: Container(
              width: width * 0.89,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: NetworkImage(
                        item.img,
                      ),
                      fit: BoxFit.fitWidth)),
            )),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    's/: ${item.precio}',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          // dataHomeLocal.addItemShop(item);
                          dataHomeLocal = DataHomeLocal();
                        });
                      },
                      color: Colors.white,
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                      )
                      )
                ],
              ),
            ),
          ],
        ),
      );

}
