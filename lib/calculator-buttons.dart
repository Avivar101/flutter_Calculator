import 'package:flutter/material.dart';
import 'calculator.dart';
import 'calculator-button.dart';
import 'calculator-row.dart';

class CalculatorButtons extends StatelessWidget {
  CalculatorButtons({Key? key, required this.onTap}) : super(key: key);

  final CalculatorButtonTapCallback onTap;
  final calculatorButtonRows = [
    ['7', '8','9', ],
    ['4', '5', '6',],
    ['1', '2', '3',],
    ['0', '00'],
    []
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