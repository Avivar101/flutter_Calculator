import 'package:flutter/material.dart';
import 'calculator.dart';
import 'calculator-button.dart';
import 'calculator-row.dart';

class CalculatorButtons extends StatelessWidget {
  CalculatorButtons({Key? key, required this.onTap}) : super(key: key);

  final CalculatorButtonTapCallback onTap;
  final calculatorButtonRows = [
    ['7', '8','9', Calculations.divide],
    ['4', '5', '6', Calculations.multiply],
    ['1', '2', '3', Calculations.subtract],
    [Calculations.period, '0', '00', Calculations.add],
    [Calculations.clear, Calculations.equal]
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