import 'package:flutter/material.dart';
import 'package:get/get.dart';
// COMPONENTES
import 'package:maps_app/componentes/appBar.dart';
import 'package:maps_app/componentes/drawerMain.dart';
import 'package:maps_app/componentes/MainBottomBar.dart';
import 'package:maps_app/componentes/cardList.dart';
import 'package:maps_app/componentes/mapaMain.dart';
import 'package:maps_app/componentes/createMatch.dart';
// CONTROLLERS
import 'package:maps_app/controllers/indexController.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Joga - PG',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  final IndexPageController pageController = Get.put(IndexPageController());

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      drawer: MainDrawer(),
      body: Container(child: GetBuilder<IndexPageController>(builder: (_) {
        return Column(
          children: [
            if (_.indexPage == 0)
              CardList()
            else if (_.indexPage == 1)
              CreateMatch()
            else if (_.indexPage == 2)
              MapaMain()
          ],
        );
      })),
      bottomNavigationBar: MainBottomBar(),
    );
  }
}
