import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen>
    with AutomaticKeepAliveClientMixin<CounterScreen> {
  int _counter = 0;
  @override
  bool get wantKeepAlive => true;

  void _addCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Required by AutomaticKeepAliveClientMixin -- missing before, which
    // throws an assertion failure in debug mode the first time this
    // widget actually builds. Pre-existing bug, unrelated to null safety.
    super.build(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MaterialButton(
              color: Theme.of(context).primaryColor,
              onPressed: () => _addCounter(),
              child: Text("Counter = " + _counter.toString()),
            ),
          ],
        ),
      ],
    );
  }
}
