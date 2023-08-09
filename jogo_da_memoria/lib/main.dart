// main.dart
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'KindaCode.com',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('KindaCode.com')),
      body: Center(
        child: FlipCard(
          direction: FlipDirection.HORIZONTAL,
          front: Container(
            width: 300,
            height: 400,
            color: Colors.red,
          ),
          back: Container(
            width: 300,
            height: 400,
            color: Colors.blue,
            child: Image.asset(
              'assets/SpongeBob_SquarePants_character.png',
              height: 100,
              width: 150,
            ),
          ),
        ),
      ),
    );
  }
}
