import 'package:flutter/material.dart';

class CardLetterInit extends StatelessWidget {
  final String letter;
  final bool activePage;
  const CardLetterInit(
      {super.key, required this.letter, required this.activePage});

  @override
  Widget build(BuildContext context) {
    final double top = activePage ? 80 : 180;
    final double blur = activePage ? 30 : 0;
    final double offSet = activePage ? 20 : 0;

    return AnimatedContainer(
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
      duration: Duration(milliseconds: 500),
      child: Center(
        child: Text(
          letter,
          style: const TextStyle(
              fontFamily: 'splurge', fontSize: 200, color: Colors.white),
        ),
      ),
    );
  }
}
