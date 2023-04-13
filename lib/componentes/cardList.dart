import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CardList extends StatefulWidget {
  @override
  State<CardList> createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  @override
  void initState() {
    _getDataFromApi();
  }

  List _loadedData = [];

  Future _getDataFromApi() async {
    final response =
        await http.post(Uri.parse('http://esporte.amttdetra.com/api/jogos'));

    setState(() {
      _loadedData = (json.decode(response.body));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: _loadedData.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                onTap: () => print('jogo ${index}'),
                title: Text(_loadedData[index]['nome_jogo']),
                subtitle: Text(
                    'Jogo Começando as ${_loadedData[index]['data_jogo']} horas'),
                leading: Icon(Icons.sports_soccer),
              ),
            );
          }),
    );
  }
}
