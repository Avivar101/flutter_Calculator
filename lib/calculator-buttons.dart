import 'package:flutter/material.dart';
import 'calculator.dart';
import 'calculator-button.dart';
import 'calculator-row.dart';

class CalculatorButtons extends StatelessWidget {
  CalculatorButtons({Key? key, required this.onTap}) : super(key: key);

  //onTap display function
  final CalculatorButtonTapCallback onTap;
  //map of buttons
  final calculatorButtonRows = [
    [Calculations.clear, Calculations.backSpace, Calculations.percentage, Calculations.divide],
    ['7', '8','9', Calculations.multiply],
    ['4', '5', '6', Calculations.subtract],
    ['1', '2', '3', Calculations.add],
    ['0', Calculations.period, Calculations.brackets, Calculations.equal]
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: calculatorButtonRows.map((calculatorRowButtons) {
        return CalculatorRow(
          buttons: calculatorRowButtons,
          onTap: onTap,
          key: UniqueKey()
        );
      }).toList(),
    );
  }
}