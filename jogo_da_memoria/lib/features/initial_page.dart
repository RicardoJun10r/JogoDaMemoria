import 'package:flutter/material.dart';
import 'package:jogo_da_memoria/components/elevated_button_component.dart';
import 'package:jogo_da_memoria/features/select_letter_alphabet/select_letter_alphabet_page.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue[500],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png'),
            Container(
              height: MediaQuery.of(context).size.height / 2.5,
              width: MediaQuery.of(context).size.width / 1.2,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButtonComponet(
                      text: 'Fácil', page: SelectLetterPage()),
                  ElevatedButtonComponet(
                      text: 'Médio', page: SelectLetterPage()),
                  ElevatedButtonComponet(
                      text: 'Difícil', page: SelectLetterPage()),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
