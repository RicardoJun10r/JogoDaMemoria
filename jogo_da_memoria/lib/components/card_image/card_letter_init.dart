import 'package:flutter/material.dart';
import 'package:jogo_da_memoria/features/home_game_grid/grid_controller.dart';
import 'package:jogo_da_memoria/features/home_game_grid/grid_page.dart';
import 'package:provider/provider.dart';

class CardLetterInit extends StatelessWidget {
  final String letter;
  final bool activePage;
  final int index;
  CardLetterInit(
      {super.key,
      required this.letter,
      required this.activePage,
      required this.index});

  List<List<Map<String, dynamic>>> listImages = [
    [
      {'name': 'assets/A/ABACATE.jpg', 'active': 1, 'selected': 0},
      {'name': 'assets/A/ABACAXI.jpg', 'active': 1, 'selected': 0},
      {'name': 'assets/A/APITO.jpg', 'active': 1, 'selected': 0},
      {'name': 'assets/A/ANEL.jpg', 'active': 1, 'selected': 0},
      {'name': 'assets/A/ABELHA.jpg', 'active': 1, 'selected': 0},
      {'name': 'assets/A/AMBULANCIA.png', 'active': 1, 'selected': 0},
      {'name': 'assets/A/ARANHA.jpg', 'active': 1, 'selected': 0},
      {'name': 'assets/A/ARVORE.jpg', 'active': 1, 'selected': 0},
      {'name': 'assets/A/ASTRONAUTA.png', 'active': 1, 'selected': 0},
      {'name': 'assets/A/AVIAO.png', 'active': 1, 'selected': 0},
    ],
    [
      {'name': 'assets/B/.jpg', 'active': 1, 'selected': 0},
      {'name': 'assets/B/.jpg', 'active': 1, 'selected': 0},
      {'name': 'assets/B/.jpg', 'active': 1, 'selected': 0},
      {'name': 'assets/B/.jpg', 'active': 1, 'selected': 0},
      {'name': 'assets/B/.png', 'active': 1, 'selected': 0},
      {'name': 'assets/B/.png', 'active': 1, 'selected': 0},
      {'name': 'assets/B/.png', 'active': 1, 'selected': 0},
      {'name': 'assets/B/.png', 'active': 1, 'selected': 0},
      {'name': 'assets/B/.png', 'active': 1, 'selected': 0},
      {'name': 'assets/B/.png', 'active': 1, 'selected': 0},
    ],
  ];

  @override
  Widget build(BuildContext context) {
    final double top = activePage ? 80 : 180;
    final double blur = activePage ? 30 : 0;
    final double offSet = activePage ? 20 : 0;
    final gridController = context.watch<GridController>();

    return InkWell(
      onTap: () {
        gridController.startGame(listImages[index]);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HomeGameGridPage()));
      },
      child: AnimatedContainer(
        margin: EdgeInsets.only(top: top, bottom: 80, right: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.pink,
            boxShadow: [
              BoxShadow(
                color: Colors.black87,
                blurRadius: blur,
                offset: Offset(offSet, offSet),
              )
            ]),
        duration: const Duration(milliseconds: 500),
        child: Center(
          child: Text(
            letter,
            style: const TextStyle(
                fontFamily: 'splurge', fontSize: 200, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
