class DataHomeLocal {
  // static List<CardItem> listItemsSneakers = [
  //   CardItem(
  //       id: 1,
  //       precio: 99,
  //       priceInitial: 99,
  //       name: 'nike pugasos',
  //       img:
  //           'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/adc22a15-f679-4f9b-869f-eb9673401afa/pegasus-turbo-next-nature-zapatillas-de-running-asfalto-48Rzt5.png'),
  //   CardItem(
  //       id: 2,
  //       precio: 34,
  //       priceInitial: 34,
  //       name: 'nike pugasos',
  //       img:
  //           'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/b39ed3f1-f3c8-47f9-8831-0782665a6715/air-zoom-pegasus-39-zapatillas-de-running-asfalto-LdrXkV.png'),
  //   CardItem(
  //       id: 3,
  //       precio: 34,
  //       priceInitial: 34,
  //       name: 'nike pugasos',
  //       img:
  //           'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/b94609b3-e292-45e6-b422-0472bbb1f916/zoomx-zegama-zapatillas-de-trail-running-txKtct.png'),
  //   CardItem(
  //       id: 4,
  //       precio: 34,
  //       priceInitial: 34,
  //       name: 'nike pugasos',
  //       img:
  //           'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/ff949353-f7da-4e1c-acab-0ed5424b4e65/react-pegasus-trail-4-zapatillas-de-trail-running-t5f6GP.png'),
  //   CardItem(
  //       id: 5,
  //       precio: 34,
  //       priceInitial: 34,
  //       name: 'nike pugasos',
  //       img:
  //           'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/34b3197a-253f-48d1-8ae6-40145d3d4929/air-zoom-vomero-16-zapatillas-de-running-carretera-xX6nxp.png'),
  //   CardItem(
  //       id: 6,
  //       precio: 34,
  //       priceInitial: 34,
  //       name: 'nike pugasos',
  //       img:
  //           'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/966d8f2a-dd27-4b55-b66f-9e80043fc67d/quest-5-zapatillas-de-running-asfalto-R8wtjM.png'),
  //   CardItem(
  //       id: 7,
  //       precio: 34,
  //       priceInitial: 34,
  //       name: 'nike pugasos',
  //       img:
  //           'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/c76f327f-df66-43fb-840e-9e1b25793cb2/zoomx-streakfly-zapatillas-de-competicion-asfalto-lrCMPz.png'),
  //   CardItem(
  //       id: 8,
  //       precio: 34,
  //       priceInitial: 34,
  //       name: 'nike pugasos',
  //       img:
  //           'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/5218dd66-7865-48c9-b4d9-87ed201eed2b/zoomx-vaporfly-next-2-zapatillas-de-competicion-asfalto-821S4F.png'),
  //   CardItem(
  //       id: 9,
  //       precio: 34,
  //       priceInitial: 34,
  //       name: 'nike pugasos',
  //       img:
  //           'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/0f8d057f-4f0c-49ad-8ae4-cf7f9278e1a2/air-zoom-tempo-next-zapatillas-de-running-asfalto-rVsrCV.png'),
  //   CardItem(
  //       id: 10,
  //       precio: 34,
  //       priceInitial: 34,
  //       name: 'nike pugasos',
  //       img:
  //           'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/7f6e3bd8-568b-46e5-bf45-bb4f8fd07e4a/air-zoom-tempo-next-zapatillas-de-running-asfalto-7kzrjk.png'),
  // ];

  // static List<CardShopItem> listShopItems = [];

  // void priceProducts(int cant, int id) {
  //   for (var i = 0; i < listShopItems.length; i++) {
  //     if (listShopItems[i].id == id)
  //       listShopItems[i].precio = listItemsSneakers[i].priceInitial * cant;
  //   }
  // }

  // void addItemShop(CardItem item) {
  //   if (listShopItems.length < 1) {
  //     var itemAdd = CardShopItem(
  //         id: item.id,
  //         precio: item.precio,
  //         cant: 1,
  //         name: item.name,
  //         img: item.img);
  //     listShopItems.insert(0, itemAdd);
  //   } else {
  //     for (var i = 0; i < listShopItems.length; i++) {
  //       // ignore: unrelated_type_equality_checks
  //       if (listShopItems[i].id == item.id) {
  //         listShopItems[i].precio = listShopItems[i].precio + item.priceInitial;
  //         listShopItems[i].precio = listShopItems[i].precio + item.precio;
  //         listShopItems[i].cant = listShopItems[i].cant + 1;
  //         return;
  //       } else {
  //         var itemAdd2 = CardShopItem(
  //             id: item.id,
  //             precio: item.precio,
  //             cant: 1,
  //             name: item.name,
  //             img: item.img);
  //         listShopItems.insert(0, itemAdd2);
  //         return;
  //       }
  //     }
  //   }
  // }

  // void addCantItem(int id) {
  //   for (var i = 0; i < listShopItems.length; i++) {
  //     // ignore: unrelated_type_equality_checks

  //     if (listShopItems[i].id == id) {
  //       // listShopItems[i].precio = listShopItems[i].precio + item.precio;
  //       listShopItems[i].cant = listShopItems[i].cant + 1;
  //       return;
  //     }
  //   }
  // }

  // void removeItem(int id) {
  //   for (var i = 0; i < listShopItems.length; i++) {
  //     // ignore: unrelated_type_equality_checks
  //     if (listShopItems[i].id == id) {
  //       if (listShopItems[i].cant > 1) {
  //         listShopItems[i].cant = listShopItems[i].cant - 1;
  //         return;
  //       } else {
  //         listShopItems.remove(listShopItems[i]);
  //         return;
  //       }
  //     }
  //   }
  // }

}