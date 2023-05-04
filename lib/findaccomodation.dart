import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class FindAccommodationPage extends StatefulWidget {
  @override
  _FindAccommodationPageState createState() => _FindAccommodationPageState();
}

class _FindAccommodationPageState extends State<FindAccommodationPage> {
  MapController _mapController = MapController();
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(178, 172, 136, 1),
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search location',
          ),
          onChanged: (value) {
            setState(() {
              _searchQuery = value;
            });
          },
        ),
      ),
      body: FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          center: LatLng(27.717245,85.323959),
          zoom: 13.0,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayer(
            markers: [
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(45.521563, -122.677433),
                builder: (ctx) => Container(
                  child: Icon(Icons.location_on),
                ),),
            ],
          ),
        ],
      ),
    );
  }
}
