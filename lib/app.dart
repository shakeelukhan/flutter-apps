import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rishtaaunty/blocs/blocs.dart' as b;
import 'package:rishtaaunty/repositories/repositories.dart' as r;

class MyApp extends StatelessWidget {
  final r.BaseRepository _repository;
  final Widget _child;

  const MyApp({
    Key key,
    @required r.BaseRepository repository,
    @required Widget child,
  })  : _repository = repository,
        _child = child,
        super(key: key);

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        home: RepositoryProvider<r.BaseRepository>.value(
          value: _repository,
          child: _child,
        ),
      );

  }
}