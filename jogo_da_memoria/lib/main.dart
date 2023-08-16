// main.dart
import 'package:flutter/material.dart';
import 'package:jogo_da_memoria/features/home_game_grid/grid_controller.dart';

import 'package:jogo_da_memoria/features/initial_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => GridController(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const InitialPage(),
    );
  }
}
