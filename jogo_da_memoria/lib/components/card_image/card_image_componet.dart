import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class CardImageComponet extends StatefulWidget {
  const CardImageComponet({super.key});

  @override
  State<CardImageComponet> createState() => _CardImageComponetState();
}

class _CardImageComponetState extends State<CardImageComponet> {
  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}
