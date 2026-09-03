import 'package:flutter/material.dart';

class TempPage extends StatefulWidget {
  int _counter = 0;

  @override
  _TempPageState createState() => _TempPageState();
}

class _TempPageState extends State<TempPage> {
  void _increment() {
    setState(() {
      widget._counter++;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        ElevatedButton(
          onPressed: _increment,
          child: const Text('Increment'),
        ),
        Text('Count: ${widget._counter}'),
      ],
    );
  }
}