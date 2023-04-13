import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MainDrawer extends Drawer {
  // bool LoggedIn = true;

  void openWebPage(String url) async {
    await launchUrl(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              decoration: BoxDecoration(color: Colors.lightGreen[800]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Menu',
                      style:
                          TextStyle(color: Color.fromRGBO(245, 245, 245, 10.0)),
                      textScaleFactor: 4),
                ],
              )),
          ListTile(
            onTap: () => openWebPage('https://esporte.amttdetra.com/sobre'),
            leading: Icon(Icons.lightbulb),
            title: Text('Sobre'),
          ),
          ListTile(
            onTap: () => openWebPage('https://esporte.amttdetra.com/solicitar'),
            leading: Icon(Icons.lightbulb),
            title: Text('Cadastrar Arena'),
          ),
          ListTile(
            onTap: () => openWebPage('https://esporte.amttdetra.com/reportar'),
            leading: Icon(Icons.error),
            title: Text('Reportar'),
          ),
        ],
      ),
    );
  }
}
