import 'package:flutter/material.dart';
import 'calculator-button.dart';

class CalculatorRow extends StatelessWidget {
  const CalculatorRow({required Key key, required this.buttons, required this.onTap});

  final List<dynamic> buttons;
  final CalculatorButtonTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    //takes in rowButtons
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: rowButtons(),
    );
  }

  List<Widget> rowButtons() {
    //rowButtons as a list Widget
    List<Widget> rowButtons = [];

    //maps out calculatorRowButtons as a grid of numbers/numberPad
    for (var buttonText in buttons) {
      rowButtons.add(
        CalculatorButton(text: buttonText, onTap: onTap)
      );
    }

    return rowButtons;
  }
}