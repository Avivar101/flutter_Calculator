import 'package:flutter/material.dart';
import 'calculator-button.dart';

class CalculatorRow extends StatelessWidget {
  const CalculatorRow({required Key key, required this.buttons, required this.onTap});

  final List<dynamic> buttons;
  final CalculatorButtonTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: rowButtons(),
    );
  }

  List<Widget> rowButtons() {
    List<Widget> rowButtons = [];

    for (var buttonText in buttons) {
      rowButtons.add(
        CalculatorButton(text: buttonText, onTap: onTap)
      );
    }

    return rowButtons;
  }
}