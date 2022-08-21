import 'package:flutter/material.dart';
import 'calculator.dart';
import 'number-display.dart';
import 'calculator-buttons.dart';
import 'history.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: MyHomePage(title: 'Calculator', key: UniqueKey(),),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({required Key key, required this.title}) : super(key:key);
  
  final String title;
  
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isNewEquation = true;
  List<double> values = [];
  List<String> operations = [];
  List<String> calculations = [];
  String calculatorString = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: false,
        actions: <Widget>[
          IconButton(
              onPressed: () {
                _navigateAndDisplayHistory(context);
              },
              icon: const Icon(Icons.history)
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          NumberDisplay(value: calculatorString, key: UniqueKey(),),
          CalculatorButtons(onTap: _onPressed),
        ],
      ),
    );
  }


  _navigateAndDisplayHistory(BuildContext context) async {

  }

  void _onPressed({String? buttonText}) {
    //Standard mathematical operations
    if (Calculations.operations.contains(buttonText)) {
      return setState(() {
        operations.add(buttonText!);
        calculatorString += ' $buttonText ';
      });
    }

    // On CLEAR press
    if (buttonText == Calculations.clear) {
      return setState(() {
        operations.add(Calculations.clear);
        calculatorString = "";
      });
    }

    // On Equals press
    if (buttonText == Calculations.equal) {
      String newCalculatorString = Calculator.parseString(calculatorString);

      return setState(() {
        if (newCalculatorString != calculatorString) {
          // only add evaluated strings to calculations array
          calculations.add(calculatorString);
        }

        operations.add(Calculations.equal);
        calculatorString = newCalculatorString;
        isNewEquation = false;
      });
    }

    if (buttonText == Calculations.period) {
      return setState(() {
        calculatorString = Calculator.addPeriod(calculatorString);
      });
    }

    setState(() {
      if (!isNewEquation
          && operations.isNotEmpty
          && operations.last == Calculations.equal) {
        calculatorString = buttonText!;
        isNewEquation = true;
      } else {
        calculatorString += buttonText!;
      }
    });
  }
}
















