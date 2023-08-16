import 'dart:async';

import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:jogo_da_memoria/components/card_image/card_image_componet.dart';

class HomeGameGridPage extends StatefulWidget {
  const HomeGameGridPage({super.key});

  @override
  State<HomeGameGridPage> createState() => _HomeGameGridPageState();
}

class _HomeGameGridPageState extends State<HomeGameGridPage> {
  List<String> imagens = [
    'assets/bobEsponja.png',
    'assets/bobEsponja.png',
    'assets/patrickEstrela.png',
    'assets/patrickEstrela.png',
    'assets/srSirigueijo.png',
    'assets/srSirigueijo.png',
    'assets/lulaMolusco.png',
    'assets/lulaMolusco.png',
  ];

  void printIndex(int index) {
    debugPrint("OLa = $index");
  }

  late int _count;

  int setCount() {
    setState(() {
      _count++;
    });

    return _count;
  }

  @override
  void initState() {
    _count = 0;
    imagens.shuffle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Caracteristicas ou numero de chances'),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20)),
        ),
        toolbarHeight: 100,
      ),
      body: Padding(
        padding: const EdgeInsets.all(2),
        child: Center(
          child: SizedBox(
            height: 400,
            width: 800,
            child: GridView.builder(
              itemCount: imagens.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return CardImageComponet(
                  imagem: imagens[index],
                  find: false,
                  setCount: () {
                    setCount();
                  },
                  update: () {
                    setState(() {});
                  },
                );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, crossAxisSpacing: 10, mainAxisSpacing: 10),
            ),
          ),
        ),
      ),
    );
  }
}
