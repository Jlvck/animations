// import 'package:animations/animated_container_demo.dart';
// import 'package:animations/tutorial/logo_app_builder.dart';
import 'package:animations/tutorial/logo_app.dart';
// import 'package:animations/fade_in_demo.dart';
import 'package:flutter/material.dart';

// A Journey across flutter.dev/animations
// Created this repo toexplore the world of animations in flutter

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Animations'),
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
  @override
  Widget build(BuildContext context) {
    return const LogoApp();
  }
}
