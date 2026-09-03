import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:rishta_aunty/blocs/blocs.dart' as b;
import 'package:rishta_aunty/data/data.dart' as d;

class BlocWidget<M extends d.BaseModel> extends StatefulWidget {
  final b.BaseBloc<M>? bloc;

  const BlocWidget(this.bloc, {super.key});

  @override
  BlocWidgetState<M> createState() => BlocWidgetState<M>();
}

class BlocWidgetState<M extends d.BaseModel> extends State<BlocWidget<M>> {
  late b.BaseBloc<M> bloc;

  @override
  void initState() {
    super.initState();
    bloc = widget.bloc ?? BlocProvider.of<b.BaseBloc<M>>(context);
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<b.BaseBloc<M>, b.BaseState<M>>(
        bloc: bloc,
        buildWhen: (previousState, state) => previousState != state,
        builder: (context, state) {
          if (state is b.BaseStateUpdating<M>) {
            return const Center(child: Text('Updating...'));
          } else if (state is b.BaseStateReady<M>) {
            final data = state.data;
            return data == null ? const SizedBox.shrink() : readyStateWidget(data);
          }
          return const Center(child: CircularProgressIndicator());
        });
  }

  Widget readyStateWidget(M data) => const SizedBox.shrink();
}
