import 'package:flutter/material.dart';
import 'package:project_final/components/app_bar.dart';
import 'package:project_final/components/background_container.dart';
import 'package:project_final/views/sidebar_menu.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SidebarMenu(),
      appBar: MyAppBar(),
      body: Container(
          decoration: BackgroundInContainer(),
          child: Center(
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [Text('data'), Text('data')],
                ),
              ],
            ),
          )),
    );
  }
}
