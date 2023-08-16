import 'package:flutter/material.dart';
import 'package:jogo_da_memoria/components/card_image/card_image_componet.dart';
import 'package:jogo_da_memoria/features/home_game_grid/grid_controller.dart';
import 'package:jogo_da_memoria/features/initial_page.dart';
import 'package:provider/provider.dart';

class HomeGameGridPage extends StatefulWidget {
  const HomeGameGridPage({super.key});

  @override
  State<HomeGameGridPage> createState() => _HomeGameGridPageState();
}

class _HomeGameGridPageState extends State<HomeGameGridPage> {
  late GridController gridController;

  @override
  Widget build(BuildContext context) {
    gridController = context.watch<GridController>();
    return gridController.win == true
        ? winPageFunc(gridController, context)
        : Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Row(
                        children: [
                          Text(
                            '${gridController.score} ',
                            style: const TextStyle(
                                fontFamily: 'splurge', fontSize: 50),
                          ),
                          const Icon(
                            Icons.star,
                            size: 40,
                            color: Colors.yellow,
                          ),
                        ],
                      ))
                ],
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
              ),
              toolbarHeight: 100,
            ),
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: SizedBox(
                  child: GridView.builder(
                    itemCount: gridController.list.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return CardImageComponet(
                        imagem: gridController.list[index]['name'],
                        find: gridController.list[index]['active'],
                        selected: gridController.list[index]['selected'],
                      );
                    },
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}

Widget winPageFunc(GridController controller, BuildContext context) {
  return Scaffold(
    body: Container(
      color: Colors.blue[500],
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  3, // Substitua pelo número desejado de ícones
                  (index) => index == 1
                      ? const Icon(
                          Icons.star,
                          size: 60,
                          color: Colors.yellow,
                          weight: 100,
                        )
                      : const Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Icon(
                            Icons.star,
                            size: 40,
                            color: Colors.yellow,
                          ),
                        ),
                ),
              ),
            ),
            const Text(
              'Você Venceu',
              style: TextStyle(
                  fontFamily: 'splurge', fontSize: 50, color: Colors.white),
            ),
            Text(
              'com ${controller.score} pontos',
              style: const TextStyle(
                  fontFamily: 'splurge', fontSize: 50, color: Colors.white),
            ),
            const SizedBox(
              height: 150,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                height: 60,
                width: 200,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'JOGAR NOVAMENTE',
                    style: TextStyle(
                      fontFamily: 'splurge',
                      fontSize: 19,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                height: 60,
                width: 200,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const InitialPage(),
                    ));
                  },
                  child: const Text(
                    'MUDAR NÍVEL',
                    style: TextStyle(fontFamily: 'splurge', fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
