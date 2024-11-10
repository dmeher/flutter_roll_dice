import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math';

import 'package:roll_dice/styled_text.dart';
import 'package:audioplayers/audioplayers.dart';

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  int currentDiceImageNumber = 2;
  bool loader = false;

  void rollDice() async {
    // setState(() {
    //   loader = true;
    // });
    // var randomNumber = randomizer.nextInt(6) + 1;
    // while (randomNumber == currentDiceImageNumber) {
    //   randomNumber = randomizer.nextInt(6) + 1;
    // }

    AudioPlayer().play(AssetSource('sounds/dice-rolling.mp3'));
    Timer(const Duration(milliseconds: 100), () {
      setState(() {
        loader = true;
      });
      Timer(const Duration(seconds: 1), () {
        var randomNumber = randomizer.nextInt(6) + 1;
        while (randomNumber == currentDiceImageNumber) {
          randomNumber = randomizer.nextInt(6) + 1;
        }
        setState(() {
          currentDiceImageNumber = randomNumber;
          loader = false;
          // Future.delayed(const Duration(milliseconds: 100), () {
          //   loader = false;
          // });
        });
      });
    });

    // setState(() {
    //   currentDiceImageNumber = randomNumber;
    //   // loader = false;
    // });
  }

  // @override
  // void didUpdateWidget(covariant DiceRoller oldWidget) {
  //   super.didUpdateWidget(oldWidget);

  //   setState(() {
  //     loader = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Visibility(
        //   visible: loader,
        //   replacement: const SizedBox.shrink(child: SizedBox(height: 200)),
        //   child: Image.asset(
        //     'assets/animations/dice/dice-roller.gif',
        //     width: 200,
        //   ),
        // ),
        // Visibility(
        //   visible: !loader,
        //   replacement: const SizedBox.shrink(child: SizedBox(height: 200)),
        //   child: Image.asset(
        //     'assets/images/dice/dice-$currentDiceImageNumber.png',
        //     width: 200,
        //   ),
        // ),
        if (loader)
          Image.asset(
            'assets/images/dice-roller.gif',
            width: 200,
          )
        else
          Image.asset(
            'assets/images/dice-$currentDiceImageNumber.png',
            width: 200,
          ),
        // Image(
        //   image:
        //       AssetImage('assets/images/dice/dice-$currentDiceImageNumber.png'),
        //   frameBuilder: (BuildContext context, Widget child, int? frame,
        //       bool? wasSynchronouslyLoaded) {
        //     return Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: child,
        //     );
        //   },
        //   loadingBuilder: (BuildContext context, Widget child,
        //       ImageChunkEvent? loadingProgress) {
        //     return Center(child: child);
        //   },
        // ),
        const SizedBox(
          height: 30,
        ),
        TextButton(
          onPressed: rollDice,
          child: const StyledText('Roll dice!'),
        )
      ],
    );
  }
}
