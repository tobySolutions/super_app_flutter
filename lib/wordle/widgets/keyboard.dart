import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../Model/letter_model.dart';
import '../../res/colors.dart';

List<String> letterRow1 = ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'];
List<String> letterRow2 = ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'];
List<String> letterRow3 = ['Z', 'X', 'C', 'V', 'B', 'N', 'M'];

class Keyboard extends StatelessWidget {
  const Keyboard({
    super.key,
    required this.onTap,
    required this.onDeleteKeyTap,
    required this.onEnterKeyTap,
    required this.letters,
  });

  final void Function(String) onTap;
  final VoidCallback onEnterKeyTap;
  final VoidCallback onDeleteKeyTap;
  final Set<Letter> letters;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Center(
        child: Column(
          children: [
            KeyboardRow(
              letterRow: letterRow1,
              onTap: onTap,
              letters: letters,
            ),
            const SizedBox(
              height: 10,
            ),
            KeyboardRow(
              letterRow: letterRow2,
              onTap: onTap,
              letters: letters,
            ),
            const SizedBox(
              height: 0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: TextButton(
                    onPressed: onEnterKeyTap,
                    child: Text(
                      'ENTER',
                      style: TextStyle(
                          color: grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Center(
                      child: KeyboardRow(
                    letterRow: letterRow3,
                    onTap: onTap,
                    letters: letters,
                  )),
                ),
                Expanded(
                  flex: 1,
                  child: TextButton(
                    onPressed: onDeleteKeyTap,
                    child: Text(
                      'Delete',
                      style: TextStyle(
                          color: grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class KeyboardRow extends StatelessWidget {
  const KeyboardRow(
      {super.key,
      required this.letterRow,
      required this.onTap,
      required this.letters});

  final List<String> letterRow;

  final void Function(String) onTap;
  final Set<Letter> letters;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      width: 330,
      child: Center(
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: letterRow.length,
            itemBuilder: (context, index) {
              final letterKey = letters.firstWhere(
                (element) => letterRow[index] == element.val,
                orElse: () => Letter.empty(),
              );

              return KeyboardButton(
                keyColor: letterKey != Letter.empty()
                    ? letterKey.status == LetterStatus.notInWord
                        ? white
                        : letterKey.backgroundColor
                    : white,
                onTap: () => onTap(letterRow[index]),
                letterRow: letterRow,
                letter: letterRow[index],
              );
            }),
      ),
    );
  }
}

class KeyboardButton extends StatelessWidget {
  const KeyboardButton(
      {super.key,
      required this.onTap,
      required this.letterRow,
      required this.letter,
      required this.keyColor});

  final VoidCallback onTap;
  final List<String> letterRow;
  final String letter;
  final HexColor keyColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 40,
        width: 30,
        child: Center(
          child: Text(
            letter,
            style: TextStyle(
                color: keyColor, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
