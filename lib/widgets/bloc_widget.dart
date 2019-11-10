import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rishtaaunty/blocs/blocs.dart' as b;
import 'package:rishtaaunty/data/data.dart' as d;

abstract class BlocWidget<M extends d.BaseModel> extends StatefulWidget {
  final b.BaseBloc<M> bloc;

  BlocWidget.fromBloc(this.bloc, {Key key}) : super(key: key);

  @override
  _BlocWidgetState<M> createState() => _BlocWidgetState<M>();

  Widget newStateWidget() => Center(child: CircularProgressIndicator());

  Widget updatingStateWidget() => Center(child: Text('Updating...'));

  Widget readyStateWidget(M data);
}

class _BlocWidgetState<M extends d.BaseModel> extends State<BlocWidget<M>> {
  b.BaseBloc<M> _bloc;
  Widget _widget;

  @override
  void initState() {
    super.initState();
    _bloc = widget.bloc ?? BlocProvider.of<b.BaseBloc<M>>(context);
    _bloc?.dispatch(b.BaseEventUpdate<M>(_bloc.getData()));
  }

  @override
  void dispose() {
    _bloc?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<b.BaseBloc<M>, b.BaseState<M>>(
        bloc: _bloc,
        condition: (previousState, state) => previousState != state,
        builder: (context, state) {
          if (state is b.BaseStateNew<M>) {
            _widget = widget.newStateWidget();
          } else if (state is b.BaseStateUpdating<M>) {
            _widget = widget.updatingStateWidget();
          } else if (state is b.BaseStateReady<M>) {
            _widget = widget.readyStateWidget(state.data);
          }
          return _widget;
        });
  }
}
