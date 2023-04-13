import 'package:flutter/material.dart';
import 'package:get/get.dart';
// CONTROLLERS
import 'package:maps_app/controllers/indexController.dart';

class MainBottomBar extends StatefulWidget {
  MainBottomBar();

  final IndexPageController pageController = Get.put(IndexPageController());

  @override
  State<MainBottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<MainBottomBar> {
  int _currentIndex = 0;

  void _changeIndex(value) {
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IndexPageController>(builder: (_) {
      return BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (value) {
          _.increment(value);
          _changeIndex(value);
        },
        selectedItemColor: Colors.green,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.sports_soccer), label: 'Lista de Jogos'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add), label: 'Criar Partida'),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_city), label: 'Mapa de Jogos')
        ],
      );
    });
  }
}
