// ignore_for_file: unused_element

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:sparking/src/pages/SlideUpMenuContent.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-33.43284254917151, -70.61483794285931),
    zoom: 18,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        color: Colors.transparent,
        minHeight: 80.0, // Altura mínima del panel
        maxHeight: 500.0,
        header: Center(
        child: Container(
          
          width: MediaQuery.sizeOf(context).width,
          height: 80,
          alignment: AlignmentDirectional.center,

          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 102, 168, 255),
            border: Border.all(
            color: const Color.fromARGB(255, 102, 168, 255),
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24.0),
              topRight: Radius.circular(24.0),
            ),

          ),
          child: const Column(
            
            children: [
              Icon(Icons.keyboard_arrow_up_outlined),
              Text(    
                '1 estacionamiento',
                style: TextStyle(
                  color: Colors.black, // Color del texto del encabezado
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
      ),
        panel:  const SlideUpMenuContent(),
        body: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
      //floatingActionButton: FloatingActionButton.extended(
        //onPressed: _goToTheLake,
        //label: const Text('To the lake!'),
        //icon: const Icon(Icons.directions_boat),
      //),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}

//---------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------
//import 'package:flutter/material.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';

//void main() {
  //runApp(MyApp());
//}

//class MyApp extends StatelessWidget {
  //@override
  //Widget build(BuildContext context) {
    //return MaterialApp(
      //title: 'Mapa GPS',
      //theme: ThemeData(
        //primarySwatch: Colors.blue,
      //),
      //home: MyHomePage(),
    //);
 // }
//}

//class MyHomePage extends StatefulWidget {
  //@override
  //MyHomePageState createState() => _MyHomePageState();
//}

//class _MyHomePageState extends State<MyHomePage> {
  //GoogleMapController? mapController;

  //final LatLng initialPosition = LatLng(37.7749, -122.4194); // Ubicación inicial en San Francisco

  //@override
  //Widget build(BuildContext context) {
    //return DefaultTabController(
      //length: 2, // Número de pestañas
      //child: Scaffold(
        //appBar: AppBar(
          //title: Text('Mapa GPS'),
          //bottom: TabBar(
            //tabs: [
              //Tab(icon: Icon(Icons.map), text: 'Mapa'),
              //Tab(icon: Icon(Icons.list), text: 'Lista'),
            //],
          //),
        //),
        //body: TabBarView(
          //children: [
            // Pestaña del mapa
            //GoogleMap(
              //initialCameraPosition: CameraPosition(
                //target: initialPosition,
               // zoom: 15.0, // Ajusta el nivel de zoom inicial
              //),
              //onMapCreated: (GoogleMapController controller) {
                //setState(() {
                  //mapController = controller;
                //});
              //},
              //markers: {
                //Marker(
                  //markerId: MarkerId('initialPosition'),
                  //position: initialPosition,
                  //infoWindow: InfoWindow(title: 'San Francisco'),
                //),
                // Agrega más marcadores si lo deseas
              //},
            //),

            // Pestaña de la lista (puedes personalizar esta parte)
            //Center(
              //child: Text('Contenido de la pestaña de lista'),
            //),
          //],
        //),
      //),
    //);
  //}
//}
