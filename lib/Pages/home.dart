import 'package:blue_app/pages/wordle_page.dart';
import 'package:blue_app/res/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/boxgrid.dart';

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
                    color: green,
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


// import 'package:flutter/material.dart';
// import 'wordle_game.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Wordle Game',
//       home: WordleScreen(),
//     );
//   }
// }

// class WordleScreen extends StatefulWidget {
//   @override
//   _WordleScreenState createState() => _WordleScreenState();
// }

// class _WordleScreenState extends State<WordleScreen> {
//   WordleGame _game = WordleGame();
//   String _guess = '';
//   List<String> _feedback = [];

//   void _checkGuess() {
//     _feedback = _game.checkGuess(_guess);
//     setState(() {
//       _guess = '';
//     });
//     if (_game.isGameWon()) {
//       showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//           title: Text('You win!'),
//           content: Text('Congratulations, you guessed the word in ${6 - _game.remainingGuesses} tries.'),
//           actions: [
//             TextButton(
//               child: Text('OK'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//                 setState(() {
//                   _game = WordleGame();
//                   _guess = '';
//                   _feedback = [];
//                 });
//               },
//             ),
//           ],
//         ),
//       );
//     } else if (_game.isGameOver()) {
//       showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//           title: Text('You lose!'),
//           content: Text('The word was "${_game.answer}".'),
//           actions: [
//             TextButton(
//               child: Text('OK'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//                 setState(() {
//                   _game = WordleGame();
//                   _guess = '';
//                   _feedback = [];
//                 });
//               },
           

