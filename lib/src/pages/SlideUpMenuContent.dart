// ignore_for_file: file_names, non_constant_identifier_names, sort_child_properties_last, avoid_unnecessary_containers, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_mapbox_navigation/flutter_mapbox_navigation.dart';
import 'package:geolocator/geolocator.dart';

class SlideUpMenuContent extends StatelessWidget {
  const SlideUpMenuContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
       decoration:const BoxDecoration(
            color:  Color.fromARGB(255, 102, 168, 255),
            borderRadius:  BorderRadius.only(
              topLeft: Radius.circular(24.0),
              topRight: Radius.circular(24.0),
            ),

          ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                height: 50,
                alignment: AlignmentDirectional.center,
                padding: const EdgeInsets.all(16.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),// Importante: utiliza shrinkWrap para que el ListView se ajuste al contenido
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return MenuCard ();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


Widget MenuCard (){
  return Card(
    color: const Color.fromARGB(255, 255, 255, 255),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Lugar del estacionamiento",
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 20,
              fontWeight: FontWeight.w800
            ),
            ),
          ),
          const Row(
            children: [
              Icon(Icons.pin_drop),
              Text("Ubicacion del estacionamiento")
            ],
          ),
          const SizedBox(height: 10),
          const Row(
            children: [
              Icon(Icons.directions_car),
              Text("Numero total de estacionamientos")
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {

              }, child: const Text(
                  "Ver Información",
                style: TextStyle(
                  color: Colors.white
                ),

              ),
                style: ElevatedButton.styleFrom(
                 backgroundColor: const Color(0xFF2B2D42)
                ),
              ),
              IconButton(onPressed:() async {

                Position myPosition = await determinePosition();

                MapBoxNavigation.instance.setDefaultOptions(MapBoxOptions(
                    initialLatitude: myPosition.latitude,
                    initialLongitude: myPosition.longitude,
                    zoom: 13.0,
                    tilt: 0.0,
                    bearing: 0.0,
                    enableRefresh: false,
                    alternatives: false,
                    voiceInstructionsEnabled: true,
                    bannerInstructionsEnabled: true,
                    allowsUTurnAtWayPoints: false,
                    mode: MapBoxNavigationMode.driving,
                    units: VoiceUnits.metric,
                    //poner false en simulateRoute
                    simulateRoute: false,
                    language: "es"));

                  final cityhall = WayPoint(name: "City Hall", latitude: myPosition.latitude, longitude: myPosition.longitude);
                  final downtown = WayPoint(name: "Downtown Buffalo", latitude: -33.417790926673796, longitude: -70.60641093038969);

                  List<WayPoint> wayPoints = [];
                  wayPoints.add(cityhall);
                  wayPoints.add(downtown);
    
                  await MapBoxNavigation.instance.startNavigation (wayPoints: wayPoints);
                  MapBoxNavigation.instance.finishNavigation();

              }, icon: const Icon(Icons.navigation_outlined))
            ],
          ),
        ],
      ),
    ),
  );
}

Future<Position> determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the 
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale 
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }
  
  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately. 
    return Future.error(
      'Location permissions are permanently denied, we cannot request permissions.');
  } 

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
}

