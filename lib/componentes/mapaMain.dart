import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class MapaMain extends StatefulWidget {
  @override
  State<MapaMain> createState() => _MapaMainState();
}

class _MapaMainState extends State<MapaMain> {
  @override
  void initState() {
    _getDataFromApi().then((value) => _carregarDados());
  }

  // Cottrolador de mapa para adicinar posteriormente as rotas
  late GoogleMapController mapController;
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  // Posicao inicial da camera
  CameraPosition _cameraPosition =
      CameraPosition(target: LatLng(-25.0942681, -50.1589852), zoom: 12);

  // Fetching Data
  List _loadedData = [];
  final List<Marker> _markers = <Marker>[];

  Future _getDataFromApi() async {
    final response =
        await http.post(Uri.parse('http://esporte.amttdetra.com/api/jogos'));
    setState(() {
      _loadedData = (json.decode(response.body));
    });
  }

  _carregarDados() async {
    for (int i = 0; i < _loadedData.length; i++) {
      _markers.add(Marker(
          markerId: MarkerId(i.toString()),
          infoWindow: InfoWindow(
            title: 'Ver mais',
            onTap: () => showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("${_loadedData[i]['nome_jogo']}"),
                  content: Text(
                      "Local: ${_loadedData[i]['nome_arena']}\nTipo: ${_loadedData[i]['tipo_arena']}\n" +
                          'Horario: ${_loadedData[i]['data_jogo']}'),
                  actions: [
                    ButtonBar(
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green),
                            onPressed: () => print("Comunicado"),
                            child: Icon(Icons.all_inclusive_sharp)),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue),
                            onPressed: () => print("Confirmar"),
                            child: Icon(Icons.check)),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green),
                            onPressed: () => print("Lista de confirmados"),
                            child: Icon(Icons.format_list_numbered_sharp))
                      ],
                    )
                  ],
                );
              },
            ),
          ),
          position: LatLng(double.parse(_loadedData[i]['lat']),
              double.parse(_loadedData[i]['lng']))));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GoogleMap(
        myLocationEnabled: true,
        onLongPress: (argument) => print('Adicionar jogo Aqui ?'),
        myLocationButtonEnabled: true,
        onMapCreated: _onMapCreated,
        initialCameraPosition: _cameraPosition,
        markers: Set<Marker>.of(_markers),
      ),
    );
  }
}
