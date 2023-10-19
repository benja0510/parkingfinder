// ignore_for_file: file_names, camel_case_types
import 'package:flutter/material.dart';

class userScreen extends StatefulWidget {
  const userScreen({super.key});

  @override
  State<userScreen> createState() => _userScreenState();
}

class _userScreenState extends State<userScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Pantalla del usuario',
          ),
        ],
      ),
    );
  }
}
