import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../res/colors.dart';

class BoxGrid extends StatelessWidget {
  const BoxGrid(
      {super.key,
      this.color,
      required this.text1,
      required this.text2,
      required this.onTapped});
  final String text1;
  final String text2;
  final HexColor? color;
  final void Function() onTapped;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped,
      child: Container(
        height: 132,
        width: 144,
        decoration:
            BoxDecoration(color: grey, borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Align(
                alignment: const Alignment(1, -1),
                child: Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                      color: color, borderRadius: BorderRadius.circular(4)),
                ),
              ),
              Align(
                alignment: const Alignment(0, 0),
                child: Text(
                  text1,
                  style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      color: Color.fromRGBO(0, 0, 0, 0.1)),
                ),
              ),
              Align(
                alignment: const Alignment(0, 0.7),
                child: Text(
                  text2,
                  style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w200,
                      color: Color.fromRGBO(0, 0, 0, 0.4)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
