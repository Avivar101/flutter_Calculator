import 'package:flutter/foundation.dart';

import 'number-formatter.dart';

class Calculations {
  static const period = '.';
  static const multiply = '*';
  static const subtract = '-';
  static const add = '+';
  static const divide = '/';
  static const clear = 'C';
  static const equal = '=';
  static const backSpace = 'Del';
  static const brackets = '( )';
  static const percentage = '%';
  static const operations= [
    Calculations.add,
    Calculations.multiply,
    Calculations.subtract,
    Calculations.divide
  ];

  static double addDouble(double a, double b) => a + b;
  static double subtractDouble(double a, double b) => a - b;
  static double divideDouble(double a, double b) => a / b;
  static double multiplyDouble(double a, double b) => a * b;
}

class Calculator {
  static String parseString(String text) {
    List<String> numbersToAdd;
    double a, b, result;
    if(text.contains(Calculations.add)) {
      numbersToAdd = text.split(Calculations.add);
      a = double.parse(numbersToAdd[0]);
      b = double.parse(numbersToAdd[1]);
      if (kDebugMode) {
        print(a);
      }

      result = Calculations.addDouble(a, b);
    } else if (text.contains(Calculations.multiply)) {
      numbersToAdd = text.split(Calculations.multiply);
      a = double.parse(numbersToAdd[0]);
      b = double.parse(numbersToAdd[1]);
      
      result = Calculations.multiplyDouble(a, b);
    } else if (text.contains(Calculations.divide)) {
      numbersToAdd = text.split(Calculations.divide);
      a = double.parse(numbersToAdd[0]);
      b = double.parse(numbersToAdd[1]);
      
      result = Calculations.divideDouble(a, b);
    } else if (text.contains(Calculations.subtract)) {
      numbersToAdd = text.split(Calculations.subtract);
      a = double.parse(numbersToAdd[0]);
      b = double.parse(numbersToAdd[1]);

      result = Calculations.subtractDouble(a, b);
    } else {return text;}

    return NumberFormatter.format(result.toString());
  }

  static String addPeriod(String calculatorString) {
    if(calculatorString.isEmpty) {
      return calculatorString = '0${Calculations.period}';
    }

    RegExp exp = RegExp(r"\d\.");
    Iterable<Match> matches = exp.allMatches(calculatorString);
    int maxMatches = Calculator.includesOperation(calculatorString) ? 2 : 1;

    return matches.length == maxMatches
        ? calculatorString
        : calculatorString += Calculations.period;
  }

  static List backSpace(List calculatorString) {
    if(calculatorString.isNotEmpty) {
      if (kDebugMode) {
        print(calculatorString.removeLast() as List<String>);
        return calculatorString;
      }
    }
    return calculatorString;
  }

  static bool includesOperation(String calculatorString) {
    for(var operation in Calculations.operations) {
      if(calculatorString.contains(operation)) {
        return true;
      }
    }
    return false;
  }

}