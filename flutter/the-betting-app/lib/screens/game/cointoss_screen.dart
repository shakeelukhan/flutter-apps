import 'package:flutter/material.dart';
import 'dart:math';

class CoinTossScreen extends StatefulWidget {
  @override
  _CoinTossScreenState createState() => _CoinTossScreenState();
}

class _CoinTossScreenState extends State<CoinTossScreen> {
  String result = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            MaterialButton(
              color: Theme.of(context).primaryColor,
              elevation: 20,
              child: Text(
                "Flip",
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
              onPressed: () {
                var rng = new Random();
                DateTime dt = DateTime.now();
                String dtString = dt.toString();
                dtString = dtString.substring(0, dtString.lastIndexOf("."));
                int r = rng.nextInt(100);
                setState(() {
                  result = dtString +
                      "    " +
                      (r < 50 ? "HEAD  " : "TAIL  ") +
                      "\n" +
                      result;
                });
              },
            ),
            Divider(color: Colors.grey),
            Expanded(
                flex: 1,
                child: ListView(
                  children: <Widget>[
                    Text(result,
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                          fontSize: 15.0,
                        )),
                  ],
                )),
          ],
        ));
  }
}
