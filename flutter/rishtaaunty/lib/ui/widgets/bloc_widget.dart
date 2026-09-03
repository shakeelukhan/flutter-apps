import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rishtaaunty/blocs/blocs.dart' as b;
import 'package:rishtaaunty/data/data.dart' as d;

class BlocWidget<M extends d.BaseModel> extends StatefulWidget {
  final b.BaseBloc<M> _bloc;

  BlocWidget(this._bloc, {Key key}) : super(key: key);

  @override
  BlocWidgetState<M> createState() => BlocWidgetState<M>();
}

class BlocWidgetState<M extends d.BaseModel> extends State<BlocWidget<M>> {
  b.BaseBloc<M> bloc;

  @override
  void initState() {
    super.initState();
    bloc = widget._bloc ?? BlocProvider.of<b.BaseBloc<M>>(context);
  }

  @override
  void dispose() {
    bloc?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<b.BaseBloc<M>, b.BaseState<M>>(
        bloc: bloc,
        condition: (previousState, state) => previousState != state,
        builder: (context, state) {
          Widget _widget;
          if (state is b.BaseStateNew<M>) {
            _widget = Center(child: CircularProgressIndicator());
          } else if (state is b.BaseStateUpdating<M>) {
            _widget = Center(child: Text('Updating...'));
          } else if (state is b.BaseStateReady<M>) {
            _widget = readyStateWidget(state.data);
          }
          return _widget;
        });
  }

  Widget readyStateWidget(M data) => null;
}
