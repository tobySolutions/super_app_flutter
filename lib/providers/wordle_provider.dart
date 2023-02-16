import 'package:flutter/material.dart';

class WordleInputProvider extends ChangeNotifier {
  String wordleInput = " ";
  int length = 5;
  List<String> inputs1 = List.filled(6, " ");
  List<String> inputs2 = List.filled(6, " ");
  List<String> inputs3 = List.filled(6, " ");
  List<String> inputs4 = List.filled(6, " ");
  List<String> inputs5 = List.filled(6, " ");
  List<String> inputs6 = List.filled(6, " ");

  void input(String letter) {
    wordleInput = letter;

    notifyListeners();
  }

  void modifyInput1() {
    if (length >= 0 && length < 6) {
      inputs1[length] = wordleInput;
    }
    if (length > 0) {
      length--;
    }
  }
}
