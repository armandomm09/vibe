import 'package:flutter/material.dart';
import 'package:flutter_application_5/components/toolbar.dart';
import 'package:flutter_application_5/styles/app_colors.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class NearbyPage extends StatelessWidget {
  const NearbyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Toolbar(title: "Nearby page"),
      body: FlutterMap(
        options: const MapOptions(
          initialCenter:  LatLng(48.8584, 2.2945),
          initialZoom: 10
        ), children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'dev.fleaflet.flutter_map.example',
  // Plenty of other options available!
        ),
        const MarkerLayer(markers: [
          Marker(
            point: LatLng(48.8584, 2.2945), 
            child: Icon(Icons.location_pin, color: AppColors.extraTone,),)
        ])
        ], 
        ),
    );
  }
}