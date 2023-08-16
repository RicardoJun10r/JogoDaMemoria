import 'package:flutter/material.dart';

class GridController extends ChangeNotifier {
  List<Map<String, dynamic>> _list = [];
  List<Map<String, dynamic>> _listSelected = [];

  List<Map<String, dynamic>> get list => _list;

  int _level = 0;
  int get level => _level;

  int _count = 0;
  int get count => _count;
  int _score = 0;
  int get score => _score;

  bool win = false;

  final List<Function> _controller = [];
  List<Function> get controller => _controller;

  final List<Map<String, dynamic>> _choice = [];

  void selectedlevel(int level) {
    _level = level;
    notifyListeners();
  }

  void numberLevel() {
    _listSelected.shuffle();
    if (level == 1) {
      _list.add(_listSelected[0]);
      _list.add(_listSelected[0]);

      _list.add(_listSelected[1]);
      _list.add(_listSelected[1]);

      _list.add(_listSelected[2]);
      _list.add(_listSelected[2]);

      _list.shuffle();
    } else if (level == 2) {
      _list.add(_listSelected[0]);
      _list.add(_listSelected[0]);

      _list.add(_listSelected[1]);
      _list.add(_listSelected[1]);

      _list.add(_listSelected[2]);
      _list.add(_listSelected[2]);

      _list.add(_listSelected[3]);
      _list.add(_listSelected[3]);

      _list.shuffle();
    } else if (level == 3) {
      _list.add(_listSelected[0]);
      _list.add(_listSelected[0]);

      _list.add(_listSelected[1]);
      _list.add(_listSelected[1]);

      _list.add(_listSelected[2]);
      _list.add(_listSelected[2]);

      _list.add(_listSelected[3]);
      _list.add(_listSelected[3]);

      _list.add(_listSelected[4]);
      _list.add(_listSelected[4]);

      _list.shuffle();
    }
  }

  void zeroRound() {
    _listSelected.clear();
    _list.clear();
    win = false;
    setCountZero();
    setScoreZero();
    notifyListeners();
  }

  void startGame(List<Map<String, dynamic>> images) {
    zeroRound();
    _listSelected.addAll(images);
    numberLevel();
    notifyListeners();
  }

  void setScoreZero() {
    _score = 0;
  }

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

      if (level == 1 && _score == 30) {
        win = true;
      } else if (level == 2 && _score == 40) {
        win = true;
      } else if (level == 3 && _score == 50) {
        win = true;
      }
    } else {
      _controller[0]();
      _controller[1]();
    }

    _controller.clear();
    _choice.clear();
    setCountZero();
    notifyListeners();
  }

  void incrementCount(String name, int find, Function reverse) {
    _count++;
    _choice.add({'name': name, 'active': find, 'selected': 1});
    _controller.add(reverse);
    notifyListeners();

    if (_count == 2) {
      Future.delayed(const Duration(milliseconds: 500), () {
        verify();
      });
    }
  }
}
