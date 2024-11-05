import 'package:flutter/material.dart';
import 'package:movies_app/views/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

   
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'Movies App',
      theme: ThemeData(
       
      primarySwatch: Colors.brown,
      ),
      home: const MoviesView(),
    );
  }
}
 