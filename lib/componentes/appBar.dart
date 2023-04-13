import 'package:flutter/material.dart';

class MainAppBar extends AppBar {
  @override
  State<MainAppBar> createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('LaCancha'),
      centerTitle: true,
      backgroundColor: Colors.lightGreen[900],
    );
  }
}
