import 'package:flutter/material.dart';
import 'package:jogo_da_memoria/features/home_game_grid/grid_controller.dart';
import 'package:provider/provider.dart';

class ElevatedButtonComponet extends StatelessWidget {
  final double? width;
  final double? height;
  final String text;
  final double? fontSize;
  final int? level;
  final Widget page;

  const ElevatedButtonComponet(
      {super.key,
      this.width = 180,
      this.height = 60,
      required this.text,
      required this.page,
      this.fontSize = 24,
      this.level});

  @override
  Widget build(BuildContext context) {
    final gridController = context.watch<GridController>();
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
        onPressed: () {
          gridController.selectedlevel(level!);
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => page));
        },
        child: Text(
          text,
          style: TextStyle(fontFamily: 'splurge', fontSize: fontSize),
        ),
      ),
    );
  }
}
