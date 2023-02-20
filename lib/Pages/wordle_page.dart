import 'package:blue_app/wordle/Model/letter_model.dart';
import 'package:blue_app/res/colors.dart';
import 'package:blue_app/res/word_list.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_svg/svg.dart';
import '../wordle/Model/word_model.dart';
import '../wordle/widgets/board.dart';
import '../wordle/widgets/keyboard.dart';

enum GameStatus { playing, submitting, lost, won }

class WordlePage extends StatefulWidget {
  const WordlePage({super.key});

  @override
  State<WordlePage> createState() => _WordlePageState();
}

class _WordlePageState extends State<WordlePage> {
  GameStatus _gameStatus = GameStatus.playing;

  final List<Word> _board = List.generate(
      6, (index) => Word(letters: List.generate(5, (index) => Letter.empty())));

  int _currentWordIndex = 0;

  Word? get _currentWord =>
      _currentWordIndex < _board.length ? _board[_currentWordIndex] : null;

  Word _solution = Word.fromString(
      fiveLetterWords[Random().nextInt(fiveLetterWords.length)].toUpperCase());

  final Set<Letter> _keyboardLetters = {};
  @override
  Widget build(BuildContext context) {
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
                letters: _keyboardLetters,
              ),
            ),
            const SizedBox(
              height: 47,
            ),
            Keyboard(
              onTap: _onKeyTapped,
              onDeleteKeyTap: _onDeleteKeyTapped,
              onEnterKeyTap: _onEnterTapped,
              letters: _keyboardLetters,
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

  void _onEnterTapped() {
    if (_gameStatus == GameStatus.playing &&
        _currentWord != null &&
        !_currentWord!.letters.contains(Letter.empty())) {
      _gameStatus = GameStatus.submitting;
    }
    for (var i = 0; i < _currentWord!.letters.length; i++) {
      final currentWordLetter = _currentWord!.letters[i];
      final currentSolutionLetter = _solution.letters[i];

      setState(() {
        if (currentWordLetter == currentSolutionLetter) {
          _currentWord!.letters[i] =
              currentWordLetter.copyWith(status: LetterStatus.correct);
        } else if (_solution.letters.contains(currentWordLetter)) {
          _currentWord!.letters[i] =
              currentWordLetter.copyWith(status: LetterStatus.inWord);
        } else {
          _currentWord!.letters[i] =
              currentWordLetter.copyWith(status: LetterStatus.notInWord);
        }
      });
      final letter = _keyboardLetters.firstWhere(
        (element) => element.val == currentWordLetter.val,
        orElse: () => Letter.empty(),
      );
      if (letter.status != LetterStatus.correct) {
        _keyboardLetters.removeWhere((e) => e.val == currentWordLetter.val);
        _keyboardLetters.add(_currentWord!.letters[i]);
      }
    }
    _checkIfWinOrLoss();
  }

  void _checkIfWinOrLoss() {
    if (_currentWord!.wordString == _solution.wordString) {
      _gameStatus = GameStatus.won;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: green,
          content: Text(
            "You won!",
            style: TextStyle(color: white),
          ),
          action: SnackBarAction(
            label: "Play Again",
            onPressed: _restart,
            textColor: white,
          ),
        ),
      );
    } else if (_currentWordIndex + 1 >= _board.length) {
      _gameStatus = GameStatus.lost;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            "You Lost! Solution: ${_solution.wordString}",
            style: TextStyle(color: white),
          ),
          action: SnackBarAction(
            label: "Play Again",
            onPressed: _restart,
            textColor: white,
          ),
        ),
      );
    } else {
      _gameStatus = GameStatus.playing;
    }
    _currentWordIndex += 1;
  }

  void _restart() {
    setState(
      () {
        _gameStatus = GameStatus.playing;
        _currentWordIndex = 0;
        _board
          ..clear()
          ..addAll(
            List.generate(
              6,
              (index) => Word(
                letters: List.generate(
                  5,
                  (index) => Letter.empty(),
                ),
              ),
            ),
          );
        _solution = Word.fromString(
          fiveLetterWords[Random().nextInt(fiveLetterWords.length)]
              .toUpperCase(),
        );
        _keyboardLetters.clear();
      },
    );
  }
}
