import 'package:blue_app/Model/letter_model.dart';
import 'package:blue_app/providers/wordle_provider.dart';
import 'package:blue_app/res/colors.dart';
import 'package:blue_app/res/word_list.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../Model/word_model.dart';
import '../widgets/board.dart';
import '../widgets/keyboard.dart';

enum GameStatus { playing, submitting, lost, won }

class WordlePage extends StatefulWidget {
  const WordlePage({super.key});

  @override
  State<WordlePage> createState() => _WordlePageState();
}

class _WordlePageState extends State<WordlePage> {
  final GameStatus _gameStatus = GameStatus.playing;

  final List<Word> _board = List.generate(
      6, (index) => Word(letters: List.generate(5, (index) => Letter.empty())));

  final int _currentWordIndex = 0;

  Word? get _currentWord =>
      _currentWordIndex < _board.length ? _board[_currentWordIndex] : null;

  final Word _solution = Word.fromString(
      fiveLetterWords[Random().nextInt(fiveLetterWords.length)].toUpperCase());

  @override
  Widget build(BuildContext context) {
    final inputProvider = Provider.of<WordleInputProvider>(context);

    return Scaffold(
      backgroundColor: deepPurple,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back,
            color: purple,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: SvgPicture.asset("Assets/book.svg"),
          ),
          const SizedBox(
            width: 21.2,
          ),
          GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.share,
              color: purple,
            ),
          ),
          const SizedBox(
            width: 25.12,
          )
        ],
        backgroundColor: deepPurple,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            Center(
              child: SvgPicture.asset("Assets/wordle.svg"),
            ),
            const SizedBox(
              height: 41,
            ),
            SizedBox(
              width: 310,
              height: 350,
              child: Board(
                rows: _board,
              ),
            ),
            const SizedBox(
              height: 47,
            ),
            Keyboard(
              onTap: _onKeyTapped,
              onDeleteKeyTap: _onDeleteKeyTapped,
              onEnterKeyTap: () {},
            )
          ],
        ),
      ),
    );
  }

  void _onKeyTapped(String val) {
    if (_gameStatus == GameStatus.playing) {
      setState(() {
        _currentWord?.addLetter(val);
      });
    }
  }

  void _onDeleteKeyTapped() {
    if (_gameStatus == GameStatus.playing) {
      setState(() {
        _currentWord?.removeLetter();
      });
    }
  }
}

// class WordleGame {
//   final List<String> _words = [
//     'apple',
//     'banana',
//     'cherry',
//     'date',
//     'elderberry',
//     'fig',
//     'grape',
//   ];
//   String _answer = '';
//   final List<String> _guesses = [];
//   int _remainingGuesses = 6;

//   WordleGame() {
//     _answer = _words[Random().nextInt(_words.length)];
//   }

//   String get answer => _answer;
//   List<String> get guesses => _guesses;
//   int get remainingGuesses => _remainingGuesses;

//   bool isGameOver() => _remainingGuesses == 0 || isGameWon();

//   bool isGameWon() => _guesses.last == _answer;

//   List<String> checkGuess(String guess) {
//     _guesses.add(guess);
//     _remainingGuesses--;
//     List<String> feedback = [];
//     for (int i = 0; i < guess.length; i++) {
//       if (_answer.contains(guess[i])) {
//         if (guess[i] == _answer[i]) {
//           feedback.add('black');
//         } else {
//           feedback.add('white');
//         }
//       } else {
//         feedback.add('gray');
//       }
//     }
//     return feedback;
//   }
// }
