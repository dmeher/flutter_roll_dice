import 'package:flutter/material.dart';
import 'package:roll_dice/dice_roller.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  // const GradientContainer(this.colors, {super.key});
  const GradientContainer({super.key, required this.colors});

  // GradientContainer.purple({super.key}): colors = [Colors.deepPurple, Colors.purple];

  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            // colors: [Colors.purple, Color.fromARGB(255, 233, 30, 155)],
            colors: colors,
            begin: startAlignment,
            end: endAlignment),
      ),
      child: const Center(
        // child: StyledText('Hello World!'),
        child: DiceRoller(),
      ),
    );
  }
}
