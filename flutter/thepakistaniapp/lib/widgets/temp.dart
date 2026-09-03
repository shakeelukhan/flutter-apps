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
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        new RaisedButton(
          onPressed: _increment,
          child: new Text('Increment'),
        ),
        new Text('Count: ${widget._counter}'),
      ],
    );
  }
}