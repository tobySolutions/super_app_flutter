import 'package:flutter/material.dart';

import '../res/colors.dart';

List<String> letterRow1 = ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'];
List<String> letterRow2 = ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'];
List<String> letterRow3 = ['Z', 'X', 'C', 'V', 'B', 'N', 'M'];

class Keyboard extends StatelessWidget {
  const Keyboard(
      {super.key,
      required this.onTap,
      required this.onDeleteKeyTap,
      required this.onEnterKeyTap});

  final void Function(String) onTap;
  final VoidCallback onEnterKeyTap;
  final VoidCallback onDeleteKeyTap;

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
            ),
            const SizedBox(
              height: 10,
            ),
            KeyboardRow(
              letterRow: letterRow2,
              onTap: onTap,
            ),
            const SizedBox(
              height: 0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: onEnterKeyTap,
                  child: Text(
                    'ENTER',
                    style: TextStyle(
                        color: grey, fontSize: 16, fontWeight: FontWeight.w600),
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
                        itemBuilder: (context, index) => GestureDetector(
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
                  onPressed: onDeleteKeyTap,
                  child: Text(
                    'Delete',
                    style: TextStyle(
                        color: grey, fontSize: 16, fontWeight: FontWeight.w600),
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
  const KeyboardRow({
    super.key,
    required this.letterRow,
    required this.onTap,
  });

  final List<String> letterRow;

  final void Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 25,
          width: 330,
          child: Center(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: letterRow.length,
              itemBuilder: (context, index) => KeyboardButton(
                onTap: () => onTap(letterRow[index]),
                letterRow: letterRow,
                letter: letterRow[index],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class KeyboardButton extends StatelessWidget {
  const KeyboardButton({
    super.key,
    required this.onTap,
    required this.letterRow,
    required this.letter,
  });

  final VoidCallback onTap;
  final List<String> letterRow;
  final String letter;

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
                color: white, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
