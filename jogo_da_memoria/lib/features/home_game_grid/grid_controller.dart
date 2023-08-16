import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';

class GridController extends ChangeNotifier {
  final List<Map<String, dynamic>> _list = [
    {'name': 'assets/bobEsponja.png', 'active': 1, 'selected': 0},
    {'name': 'assets/bobEsponja.png', 'active': 1, 'selected': 0},
    {'name': 'assets/patrickEstrela.png', 'active': 1, 'selected': 0},
    {'name': 'assets/patrickEstrela.png', 'active': 1, 'selected': 0},
    {'name': 'assets/srSirigueijo.png', 'active': 1, 'selected': 0},
    {'name': 'assets/srSirigueijo.png', 'active': 1, 'selected': 0},
  ];

  List<Map<String, dynamic>> get list => _list;

  int _count = 0;

  int get count => _count;
  int _score = 0;
  final List<FlipCardController> _controller = [];

  List<FlipCardController> get controller => _controller;

  final List<Map<String, dynamic>> _choice = [];

  void setCountZero() {
    _count = 0;
  }

  void verify() {
    if (_choice[0]['name'] == _choice[1]['name']) {
      print('acertou');
      _score += 10;
      for (int i = 0; i < _list.length; i++) {
        if (_list[i]['name'] == _choice[0]['name']) {
          _list[i]['active'] = 0;
        }
      }
    } else {
      _controller[1].toggleCard();
      _controller[0].toggleCard();
    }

    _controller.clear();
    _choice.clear();

    setCountZero();
    notifyListeners();
  }

  void incrementCount(String name, int find) {
    _count++;
    _choice.add({'name': name, 'active': find, 'selected': 1});
    notifyListeners();

    if (_count == 2) {
      Future.delayed(Duration(milliseconds: 500), () {
        verify();
      });
    }
  }
}
