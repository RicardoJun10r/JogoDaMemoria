import 'dart:async';

import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';

class CardImageComponet extends StatefulWidget {
  final String imagem;
  late FlipCardController flipCardController;

  CardImageComponet(
      {super.key, required this.imagem, required this.flipCardController});

  @override
  State<CardImageComponet> createState() => _CardImageComponetState();
}

class _CardImageComponetState extends State<CardImageComponet> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlipCard(
        controller: widget.flipCardController,
        onFlip: () {
          String nome = widget.imagem;
          debugPrint("Eu sou $nome");
        },
        direction: FlipDirection.HORIZONTAL,
        front: Container(
          width: 500,
          height: 500,
          color: Colors.red,
        ),
        back: Container(
          width: 500,
          height: 500,
          color: Colors.blue,
          child: Image.asset(
            widget.imagem,
            height: 100,
            width: 250,
          ),
        ),
      ),
    );
  }
}
