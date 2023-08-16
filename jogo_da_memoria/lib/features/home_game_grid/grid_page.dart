import 'package:flutter/material.dart';
import 'package:jogo_da_memoria/components/card_image/card_image_componet.dart';
import 'package:jogo_da_memoria/features/home_game_grid/grid_controller.dart';
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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Caracteristicas ou numero de chances'),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20)),
        ),
        toolbarHeight: 100,
      ),
      body: Padding(
        padding: const EdgeInsets.all(2),
        child: Center(
          child: SizedBox(
            child: GridView.builder(
              itemCount: gridController.list.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return CardImageComponet(
                  imagem: gridController.list[index]['name'],
                  find: gridController.list[index]['active'],
                  x: () {
                    gridController.incrementCount(
                        gridController.list[index]['name'],
                        gridController.list[index]['active']);
                  },
                  selected: gridController.list[index]['selected'],
                );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
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
