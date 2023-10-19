// ignore_for_file: non_constant_identifier_names, sort_child_properties_last

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sparking/src/firebase_options.dart';
import 'package:sparking/src/pages/inicio_sesion.dart';
import 'package:sparking/src/pages/map_page.dart';
import 'package:sparking/src/pages/userScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Parking Finder',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Parking Finder'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  List<dynamic> Screens = [const MapPage(),const userScreen()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: Screens[_selectedIndex],
      appBar: (FirebaseAuth.instance.currentUser!=null) ? AppBar(
      backgroundColor: const Color.fromARGB(255, 102, 168, 255),
      automaticallyImplyLeading: false,
      title: Text(FirebaseAuth.instance.currentUser?.email ?? ""),  
      ):null,

      floatingActionButton: (FirebaseAuth.instance.currentUser!=null) ? FloatingActionButton(onPressed: () async {
        await FirebaseAuth.instance.signOut();
        setState(() {});
      },
      child: const Icon(Icons.logout, color: Colors.white,),
      backgroundColor: Colors.black,
      ):null,

      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor:const Color.fromARGB(255, 102, 168, 255),
        elevation: 0,
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            label: 'Mapa',
          ),
          BottomNavigationBarItem(
          icon: IconButton(
          icon:const FaIcon(FontAwesomeIcons.solidCircleQuestion),
    onPressed: () {
      Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) => const LoginPage(),
        ),
      );
    },
  ),
  label: 'Usuario',
),

        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black87,
        unselectedItemColor: Colors.black87,
        onTap: _onItemTapped,
      ),
    );
  }
}