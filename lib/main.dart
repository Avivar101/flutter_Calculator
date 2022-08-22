//imports
import 'package:flutter/material.dart';
import 'calculator.dart';
import 'number-display.dart';
import 'calculator-buttons.dart';
import 'history.dart';

//run root app
void main() {
  runApp(const MyApp());
}

//root class
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  //builds the home page with a materialApp
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple
      ),
      home: MyHomePage(title: 'Calculator', key: UniqueKey()),
      debugShowCheckedModeBanner: false,
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
                //calculation history
                _navigateAndDisplayHistory(context);
              },
              icon: const Icon(Icons.history)
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          //displays the numbers your calculating
          NumberDisplay(value: calculatorString, key: UniqueKey(),),
          //displays the calculator buttons
          CalculatorButtons(onTap: _onPressed),
        ],
      ),
    );
  }


  _navigateAndDisplayHistory(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => History(operations: calculations))
    );

    if (result != null) {
      setState(() {
        isNewEquation = false;
        calculatorString = Calculator.parseString(result);
      });
    }
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
















