import 'dart:core';
import 'package:flutter/material.dart';

typedef dynamic FunctionWithArguments(
    List<dynamic> positionalArguments, Map<Symbol, dynamic> namedArguments);

class Parser {
  void printMap(Map map) => print(map.entries.toList());

  Map<Symbol, dynamic> parser(
      List<dynamic> positionalArguments, Map<Symbol, dynamic> namedArguments) {
//    print(namedArguments);
    //   printMap(namedArguments);
    return namedArguments;
  }

  @override
  dynamic noSuchMethod(Invocation invocation) {
    if (invocation.isMethod &&
        invocation.memberName == const Symbol('parser')) {
      return parser(invocation.positionalArguments, invocation.namedArguments);
    }
  }
}

mixin Test {
  void temp({int a = 1, int b}) {
    print("A=${a} B=${b}");
  }

  void parserMain() {
    dynamic person = new Parser();

    Map<Symbol, dynamic> blah = person.parser(a: 3, b: 3);
    //  Function.apply(temp, [], blah);

    blah = person.parser(icon: const Icon(Icons.home), title: Text("Home"));
    BottomNavigationBarItem blah2 = BottomNavigationBarItem(
        icon: const Icon(Icons.home), title: Text("Home"));
    //  Function.apply(() => BottomNavigationBarItem(), null, blah);
  }
}
