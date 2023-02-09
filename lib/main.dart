import 'package:flutter/material.dart';
import 'package:ui_movie_info_app/screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie-Info App',
      theme: ThemeData(),
      home: HomeScreen(),
    );
  }
}
