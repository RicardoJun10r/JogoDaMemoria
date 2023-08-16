import 'package:flutter/material.dart';
import 'package:jogo_da_memoria/components/card_image/card_letter_init.dart';
import 'package:jogo_da_memoria/features/home_game_grid/grid_controller.dart';
import 'package:jogo_da_memoria/features/home_game_grid/grid_page.dart';
import 'package:provider/provider.dart';

class SelectLetterPage extends StatefulWidget {
  const SelectLetterPage({super.key});

  @override
  State<SelectLetterPage> createState() => _SelectLetterPageState();
}

class _SelectLetterPageState extends State<SelectLetterPage> {
  final PageController _pageController = PageController(viewportFraction: 0.8);
  int currentPage = 0;
  List<String> listLetter = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z',
  ];

  @override
  void initState() {
    _pageController.addListener(() {
      int next = _pageController.page!.round();
      if (currentPage != next) {
        setState(() {
          currentPage = next;
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selecione a letra'),
      ),
      body: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => HomeGameGridPage(),
          ));
        },
        child: Ink(
          child: Container(
            color: Colors.blue[500],
            child: Center(
              child: PageView.builder(
                controller: _pageController,
                itemCount: listLetter.length,
                itemBuilder: (BuildContext context, int index) {
                  bool activePage = index == currentPage;
                  return Stack(children: [
                    CardLetterInit(
                        letter: listLetter[index], activePage: activePage),
                  ]);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
