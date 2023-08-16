import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:jogo_da_memoria/features/home_game_grid/grid_controller.dart';
import 'package:provider/provider.dart';

class CardImageComponet extends StatefulWidget {
  final String imagem;
  final int find;
  final int selected;
  final Function x;

  const CardImageComponet({
    super.key,
    required this.imagem,
    required this.find,
    required this.x,
    required this.selected,
  });

  @override
  State<CardImageComponet> createState() => _CardImageComponetState();
}

class _CardImageComponetState extends State<CardImageComponet> {
  late FlipCardController cardKey;

  @override
  void initState() {
    super.initState();
    cardKey = FlipCardController();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlipCard(
        controller: cardKey,
        onFlip: () {
          Provider.of<GridController>(context, listen: false)
              .controller
              .add(cardKey);
          widget.selected == 0 ? widget.x() : null;
        },
        flipOnTouch: widget.find == 0 ? false : true,
        direction: FlipDirection.HORIZONTAL,
        front: Container(
          width: 350,
          height: 350,
          color: Colors.red,
        ),
        back: Container(
          width: 350,
          height: 350,
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
