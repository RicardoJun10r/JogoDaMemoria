import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class CardImageComponet extends StatefulWidget {
  final String imagem;
  final bool find;
  final Function setCount;
  final Function update;

  const CardImageComponet(
      {super.key,
      required this.imagem,
      required this.find,
      required this.setCount,
      required this.update});

  @override
  State<CardImageComponet> createState() => _CardImageComponetState();
}

class _CardImageComponetState extends State<CardImageComponet> {
  bool _activeCard = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlipCard(
        onFlip: () {
          setState(() {
            _activeCard ? _activeCard = false : null;
            widget.update();
            print(widget.setCount().toString());
          });

          String nome = widget.imagem;
          debugPrint("Eu sou $nome");
        },
        flipOnTouch: _activeCard,
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
