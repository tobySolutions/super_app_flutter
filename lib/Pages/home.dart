import 'package:blue_app/Pages/wordle_page.dart';
import 'package:blue_app/res/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Widgets/boxgrid.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.dark_mode,
                color: grey,
              )),
          const SizedBox(
            width: 35,
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 34,
            ),
            Center(
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(
                      fontSize: 40, fontWeight: FontWeight.w800),
                  children: [
                    TextSpan(text: "Blue", style: TextStyle(color: purple)),
                    TextSpan(text: "Apps", style: TextStyle(color: black)),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 120,
            ),
            SizedBox(
              height: 350,
              width: 350,
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 20,
                    crossAxisCount: 2,
                    crossAxisSpacing: 20),
                children: [
                  BoxGrid(
                    text1: "WO",
                    text2: "Wordle",
                    color: green!,
                    onTapped: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => const WordlePage()));
                    },
                  ),
                  BoxGrid(
                    text1: "VC",
                    text2: "Video Call",
                    color: orange,
                    onTapped: () {},
                  ),
                  BoxGrid(
                    text1: "",
                    text2: "",
                    onTapped: () {},
                  ),
                  BoxGrid(
                    text1: "",
                    text2: "",
                    onTapped: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
