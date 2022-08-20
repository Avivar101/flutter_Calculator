import 'package:flutter/material.dart';

typedef void CalculatorButtonTapCallback({String buttonText});

class CalculatorButton extends StatelessWidget {
  const CalculatorButton({ required this.text, required this.onTap,});

  final CalculatorButtonTapCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromRGBO(0, 0, 0, 0.1),
              width: 0.5
            )
          ),
          child: TextButton(
            onPressed: () => onTap(buttonText: text),
            child: Text(
              text,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
        ));
  }
}