import 'package:flutter/material.dart';
import 'dart:math';

class WordlePage extends StatefulWidget {
  const WordlePage({super.key});

  @override
  State<WordlePage> createState() => _WordlePageState();
}

class _WordlePageState extends State<WordlePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

class WordleGame {
  final List<String> _words = [
    'apple',
    'banana',
    'cherry',
    'date',
    'elderberry',
    'fig',
    'grape'
  ];
  String _answer = '';
  final List<String> _guesses = [];
  int _remainingGuesses = 6;

  WordleGame() {
    _answer = _words[Random().nextInt(_words.length)];
  }

  String get answer => _answer;
  List<String> get guesses => _guesses;
  int get remainingGuesses => _remainingGuesses;

  bool isGameOver() => _remainingGuesses == 0 || isGameWon();

  bool isGameWon() => _guesses.last == _answer;

  List<String> checkGuess(String guess) {
    _guesses.add(guess);
    _remainingGuesses--;
    List<String> feedback = [];
    for (int i = 0; i < guess.length; i++) {
      if (_answer.contains(guess[i])) {
        if (guess[i] == _answer[i]) {
          feedback.add('black');
        } else {
          feedback.add('white');
        }
      } else {
        feedback.add('gray');
      }
    }
    return feedback;
  }
}
