import 'package:flutter/material.dart';

class SelectLetterPage extends StatefulWidget {
  const SelectLetterPage({super.key});

  @override
  State<SelectLetterPage> createState() => _SelectLetterPageState();
}

class _SelectLetterPageState extends State<SelectLetterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selecione a letra'),
      ),
      body: Container(
        color: Colors.blue[500],
      ),
    );
  }
}
