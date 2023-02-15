import 'package:blue_app/res/colors.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter_svg/svg.dart';

class WordlePage extends StatefulWidget {
  const WordlePage({super.key});

  @override
  State<WordlePage> createState() => _WordlePageState();
}

class _WordlePageState extends State<WordlePage> {
  @override
  Widget build(BuildContext context) {
    List<String> letterRow1 = [
      'Q',
      'W',
      'E',
      'R',
      'T',
      'Y',
      'U',
      'I',
      'O',
      'P'
    ];
    List<String> letterRow2 = ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'];

    List<String> letterRow3 = ['Z', 'X', 'C', 'V', 'B', 'N', 'M'];
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
              child: Column(
                children: [
                  WordRow(
                    inputText: "S",
                    color: darkGrey!,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  WordRow(
                    inputText: "S",
                    color: darkGrey!,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  WordRow(
                    inputText: "S",
                    color: darkGrey!,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  WordRow(
                    inputText: "S",
                    color: darkGrey!,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  WordRow(
                    inputText: "S",
                    color: darkGrey!,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  WordRow(
                    inputText: "S",
                    color: darkGrey!,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 47,
            ),
            SizedBox(
              height: 150,
              child: Center(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 25,
                          width: 330,
                          child: Center(
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: letterRow1.length,
                              itemBuilder: (context, index) => GestureDetector(
                                onTap: () {},
                                child: SizedBox(
                                  height: 20,
                                  width: 30,
                                  child: Center(
                                    child: Text(
                                      letterRow1[index],
                                      style: TextStyle(
                                          color: white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 25,
                          width: 330,
                          child: Center(
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: letterRow2.length,
                              itemBuilder: (context, index) => GestureDetector(
                                onTap: () {},
                                child: SizedBox(
                                  height: 20,
                                  width: 30,
                                  child: Center(
                                    child: Text(
                                      letterRow2[index],
                                      style: TextStyle(
                                          color: white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'ENTER',
                            style: TextStyle(
                                color: grey,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Center(
                          child: SizedBox(
                            height: 25,
                            width: 210,
                            child: Center(
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: letterRow3.length,
                                itemBuilder: (context, index) =>
                                    GestureDetector(
                                  onTap: () {},
                                  child: SizedBox(
                                    height: 20,
                                    width: 30,
                                    child: Center(
                                      child: Text(
                                        letterRow3[index],
                                        style: TextStyle(
                                            color: white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Delete',
                            style: TextStyle(
                                color: grey,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class WordRow extends StatelessWidget {
  WordRow({super.key, required this.color, required this.inputText});
  String? inputText;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 310,
          height: 50,
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => const SizedBox(
              width: 15,
            ),
            itemCount: 6,
            itemBuilder: (context, index) => Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
              child: Center(child: Text(inputText!)),
            ),
          ),
        ),
      ],
    );
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
    'grape',
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
