import 'package:flutter/material.dart';
import 'package:jogo_da_memoria/features/components/card_image/card_image_componet.dart';

class HomeGameGridPage extends StatefulWidget {
  const HomeGameGridPage({super.key});

  @override
  State<HomeGameGridPage> createState() => _HomeGameGridPageState();
}

class _HomeGameGridPageState extends State<HomeGameGridPage> {
  @override
  Widget build(BuildContext context) {
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
        padding: const EdgeInsets.all(10),
        child: Center(
          child: SizedBox(
            height: 500,
            width: 300,
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                CardImageComponet(),
                CardImageComponet(),
                CardImageComponet(),
                CardImageComponet(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
