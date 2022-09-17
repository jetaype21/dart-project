import 'package:flutter/material.dart';
import 'package:project_final/pages/about_page.dart';
import 'package:project_final/pages/collection_page.dart';
import 'package:project_final/pages/home_page.dart';
import 'package:project_final/pages/sport_page.dart';
import 'package:project_final/pages/street_page.dart';
import 'package:project_final/pages/suggestion_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        });
  }
}
