import 'package:flutter/material.dart';
import 'dart:math';

import 'package:roll_dice/styled_text.dart';

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

  void rollDice() {
    var randomNumber = randomizer.nextInt(6) + 1;
    while (randomNumber == currentDiceImageNumber) {
      randomNumber = randomizer.nextInt(6) + 1;
    }
    setState(() {
      // for (int i = 0; i < 10; i++) {
      //   var tempRandomNumber = randomizer.nextInt(6) + 1;
      //   Timer(const Duration(seconds: 2), () {
      //     while (randomNumber == currentDiceImageNumber) {
      //       randomNumber = randomizer.nextInt(6) + 1;
      //     }
      //     currentDiceImageNumber = randomNumber;
      //   });
      // }
      currentDiceImageNumber = randomNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/dice-$currentDiceImageNumber.png',
          width: 200,
        ),
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
