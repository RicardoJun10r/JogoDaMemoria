import 'dart:math';
import 'package:flutter/material.dart';
import 'package:jogo_da_memoria/features/home_game_grid/grid_controller.dart';
import 'package:provider/provider.dart';

class CardImageComponet extends StatefulWidget {
  final String imagem;
  final int find;
  final int selected;

  const CardImageComponet({
    super.key,
    required this.imagem,
    required this.find,
    required this.selected,
  });

  @override
  State<CardImageComponet> createState() => _CardImageComponetState();
}

class _CardImageComponetState extends State<CardImageComponet>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this, // the SingleTickerProviderStateMixin
      duration: const Duration(milliseconds: 400),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void flipCard() {
    context
        .read<GridController>()
        .incrementCount(widget.imagem, widget.find, reverse);
    controller.forward();
  }

  void reverse() {
    controller.reverse();
  }

  AssetImage getImage(double angulo) {
    if (angulo > 0.5 * pi) {
      return AssetImage(widget.imagem);
    } else {
      return const AssetImage('assets/costa.jpg');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final angulo = controller.value * pi;
        final transform = Matrix4.identity()
          ..setEntry(3, 2, 0.002)
          ..rotateY(angulo);
        return GestureDetector(
          onTap: () {
            flipCard();
          },
          child: Transform(
            transform: transform,
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.pink, width: 3),
                  image: DecorationImage(
                    image: getImage(angulo),
                  )),
            ),
          ),
        );
      },
    );
  }
}
