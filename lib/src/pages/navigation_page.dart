// ignore_for_file: unused_element, unnecessary_new, sort_child_properties_last, unused_local_variable
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';


class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (_) => new _NotificacionModelo (),
      
      child: Scaffold(

        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('Notificaciones'),
        ),

        
        floatingActionButton:const BotonFlotante(),
        //body: ,
    
        bottomNavigationBar: const BottomNavigation(),
    
    
      ),
    );  
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key, });

  @override
  Widget build(BuildContext context) {

    final int numero = Provider.of<_NotificacionModelo>(context).numero;              

    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor:  Colors.blue ,
      items: [

      const BottomNavigationBarItem(
        label: 'Ayuda',
        icon: FaIcon(FontAwesomeIcons.solidCircleQuestion)
        
        ),

      BottomNavigationBarItem(
        label:'Notificaciones', 
        icon: Stack(
          children: <Widget> [
            const FaIcon(FontAwesomeIcons.solidBell),
            
            Positioned(
              top: 0.0,
              right: 0.0,
              //child: Icon(Icons.brightness_1, size: 8,color: Colors.redAccent,)
              child:BounceInDown(
                from: 10,
                animate: (numero >0)? true : false,
                child: Container (
                  child:Text('$numero', style: const TextStyle(color: Colors.white, fontSize: 9),),
                  alignment: Alignment.center,
                  width: 12,
                  height: 12,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  
                  
    
                  
                ),
              ),
            )
          ],
        ),  
      ),     
      
      //const BottomNavigationBarItem(
        //label: 'Ayuda', 
        //icon: FaIcon(FontAwesomeIcons.dog)
        //),


      ],
    );
  }
}




class BotonFlotante extends StatelessWidget {
  const BotonFlotante({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.blue,
      onPressed: (){

        int numero = Provider.of<_NotificacionModelo>(context, listen: false).numero;
        numero++;

        Provider.of<_NotificacionModelo>(context, listen: false).numero = numero;
      },
      child: const FaIcon(FontAwesomeIcons.play),
      
      
     );
  }
}

class _NotificacionModelo extends ChangeNotifier{

  int _numero = 0;

  int get numero => _numero ;

  set numero (int valor){

     _numero = valor;
     notifyListeners();

  }

}
