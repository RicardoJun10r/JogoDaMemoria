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

  late FlipCardController _flipCardController;
  bool _isFliped = false;

  void _flipCard() {
    Timer(Duration.zero, () {
      if (mounted) {
        _flipCardController.toggleCard();
        setState(() {
          _isFliped = !_isFliped;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _flipCardController = FlipCardController();
    imagens.shuffle();
  }

  void printIndex(int index) {
    debugPrint("OLa = $index");
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
            child: GridView.count(
                crossAxisCount: 5,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  ElevatedButton(
                    onPressed: () => {_flipCard()},
                    child: const Text("Aperte"),
                  ),
                  CardImageComponet(
                      imagem: imagens[0],
                      flipCardController: _flipCardController),
                  CardImageComponet(
                      imagem: imagens[1],
                      flipCardController: _flipCardController),
                  CardImageComponet(
                      imagem: imagens[2],
                      flipCardController: _flipCardController),
                  CardImageComponet(
                      imagem: imagens[3],
                      flipCardController: _flipCardController),
                  CardImageComponet(
                      imagem: imagens[4],
                      flipCardController: _flipCardController),
                  CardImageComponet(
                      imagem: imagens[5],
                      flipCardController: _flipCardController),
                  CardImageComponet(
                      imagem: imagens[6],
                      flipCardController: _flipCardController),
                  CardImageComponet(
                      imagem: imagens[7],
                      flipCardController: _flipCardController),
                ]),
          ),
        ),
      ),
    );
  }
}
