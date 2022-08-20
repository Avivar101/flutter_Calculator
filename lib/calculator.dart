import 'number-formatter.dart';

class Calculations {
  static const period = '.';
  static const multiply = '*';
  static const subtract = '-';
  static const add = '+';
  static const divide = '/';
  static const clear = 'CLEAR';
  static const equal = '=';
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

      result = Calculations.addDouble(a, b);
    } else {return text;}

    return NumberFormatter.format(result.toString());
  }
}