// ignore_for_file: file_names

import 'package:cinemapedia/config/constans/environment.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const name = "home-screen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(Environment.movieDBkey),
      ),
    );
  }
}
