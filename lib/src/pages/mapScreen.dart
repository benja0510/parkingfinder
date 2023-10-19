// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:sparking/src/pages/SlideUpMenuContent.dart';


class mapScreen extends StatefulWidget {
  const mapScreen({super.key});

  @override
  State<mapScreen> createState() => _mapScreenState();
}

class _mapScreenState extends State<mapScreen> {


  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      color: const Color.fromARGB(255, 102, 168, 255),
      panel:  const SlideUpMenuContent(),
      body: const Center(
        child: Text("Pantalla de mapa")
      ),
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(24.0),
        topRight: Radius.circular(24.0),
      ),
      minHeight: 50.0, // Altura mínima del panel
      maxHeight: 500.0,
      header: Center(
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          height: 60,
          alignment: AlignmentDirectional.center,

          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color:const Color.fromARGB(255, 102, 168, 255),
            border: Border.all(
              color: const Color.fromARGB(255, 192, 192, 192),
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24.0),
              topRight: Radius.circular(24.0),
            ),
          ),
          child: const Text(
            '1 estacionamiento',
            style: TextStyle(
              color: Colors.black, // Color del texto del encabezado
              fontSize: 18.0,
            ),
          ),
        ),
      ),
      // Altura máxima del panel
    );
  }
}
