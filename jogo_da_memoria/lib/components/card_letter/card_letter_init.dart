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

  final List<List<Map<String, dynamic>>> listImages = [
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
      {'name': 'assets/B/barata.png', 'active': 1, 'selected': 0},
      {'name': 'assets/B/barnei.png', 'active': 1, 'selected': 0},
      {'name': 'assets/B/bart.png', 'active': 1, 'selected': 0},
      {'name': 'assets/B/batman.png', 'active': 1, 'selected': 0},
      {'name': 'assets/B/ben10.png', 'active': 1, 'selected': 0},
      {'name': 'assets/B/bob.png', 'active': 1, 'selected': 0},
      {'name': 'assets/B/broly.png', 'active': 1, 'selected': 0},
      {'name': 'assets/B/bobEsponja.png', 'active': 1, 'selected': 0},
      {'name': 'assets/B/batata.png', 'active': 1, 'selected': 0},
      {'name': 'assets/B/bulbasaur.png', 'active': 1, 'selected': 0},
    ],
    [
      {'name': 'assets/C/cailou.png', 'active': 1, 'selected': 0},
      {'name': 'assets/C/capitamarvel.png', 'active': 1, 'selected': 0},
      {'name': 'assets/C/chapolin.png', 'active': 1, 'selected': 0},
      {'name': 'assets/C/capitaoamerica.png', 'active': 1, 'selected': 0},
      {'name': 'assets/C/ciclope.png', 'active': 1, 'selected': 0},
      {'name': 'assets/C/cinderella.png', 'active': 1, 'selected': 0},
      {'name': 'assets/C/coringa.png', 'active': 1, 'selected': 0},
      {'name': 'assets/C/chicobento.png', 'active': 1, 'selected': 0},
      {'name': 'assets/C/charliebrown.png', 'active': 1, 'selected': 0},
      {'name': 'assets/C/charliechaplin.png', 'active': 1, 'selected': 0},
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
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const HomeGameGridPage()));
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
