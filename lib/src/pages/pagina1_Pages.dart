// ignore_for_file: file_names

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sparking/src/pages/inicio_sesion.dart';
import 'package:sparking/src/pages/map_page.dart';
import 'package:sparking/src/pages/navigation_page.dart';


class Pagina1Pages extends StatelessWidget {
  const Pagina1Pages({super.key});
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
        backgroundColor: Colors.white,
    
        appBar: AppBar(
          title: FadeIn(
            duration: const Duration(milliseconds: 500),
            child: const Text('Parking Finder'),
            
            ),
            actions: <Widget>[
    
            IconButton(
              icon:const FaIcon(FontAwesomeIcons.solidCircleQuestion),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> const NavigationPage()));
              },
              ),
    
    
            //IconButton(
              //icon:const Icon(Icons.navigate_next),
              //onPressed: (){
                //Navigator.push(context,CupertinoPageRoute(builder: (BuildContext context)=> const Pagina1Pages()));
              //},
            //),
    
            IconButton(
              icon:const Icon(Icons.map),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const MapPage()));
              }
              
            ),
          ],
        ),
    
    
            floatingActionButton: 
            ElasticInRight(
              child: FloatingActionButton(
              child:const FaIcon( FontAwesomeIcons.user),
                 onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> const LoginPage()));
                 }),
            ) ,
    
            body:  Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
    
                ElasticIn(
                  delay: const Duration(milliseconds: 1100),
                  child: const Icon(Icons.location_on_outlined, color: Colors.blue, size: 40)),
    
                FadeInDown(
                  delay: const Duration(milliseconds: 2000),
                  child: const Text('Bienvenido a Parking Finder', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w200, color: Colors.black))),
                
                
                FadeInDown(
                  delay: const Duration(milliseconds: 800),
                  child: const Text('Con nosotros tu espacio está reservado.', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200, color: Colors.black))),    
    
                //FadeInLeft(
                  //delay: const Duration(milliseconds: 1000),
                  //child: Container(
                    //width: 220,
                    //height: 2,
                    //color :Colors.blue,
                      //),
                      //)
                      
            ]
          ),
        ) , 
      );
  }
}