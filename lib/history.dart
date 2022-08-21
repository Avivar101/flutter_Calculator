import 'package:flutter/material.dart';
import 'calculator.dart';


class History extends StatelessWidget {
  const History({Key? key, required this.operations}) : super(key: key);
  final List<String> operations;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
        centerTitle: false,
      ),
      body: Center(
        child: _operations(operations)
      )
    );
  }

  Widget _operations(List<String> operations) {
    return ListView.builder(
        itemCount: operations.length,
        itemBuilder: (BuildContext context, int i) {
          return ListTile(
            title: Text(operations[i]),
            onTap: () {
              Navigator.pop(context, operations[i]);
            },
            leading: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0x00000032),
                  width: 2.0
                ),
                borderRadius: BorderRadius.circular(50)
              ),
              padding: const EdgeInsets.all(10),
              child: Text(
                Calculator.parseString(operations[i]),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),
          );
        }
    );
  }
}