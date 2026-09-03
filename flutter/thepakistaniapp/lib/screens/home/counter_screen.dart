import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen>
    with AutomaticKeepAliveClientMixin<CounterScreen> {
  int _counter;
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _counter = 0;
  }

  _addCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MaterialButton(
              color: Theme.of(context).primaryColor,
              child: Text("Counter = " + _counter.toString()),
              onPressed: () => _addCounter(),
            ),
          ],
        ),
      ],
    );
  }
}
