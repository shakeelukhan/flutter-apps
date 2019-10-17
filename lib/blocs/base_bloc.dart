import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rishtaaunty/models/base_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:rishtaaunty/utils/logger_utils.dart';

part 'package:rishtaaunty/blocs/base_state.part.dart';
part 'package:rishtaaunty/blocs/base_event.part.dart';
part 'package:rishtaaunty/pages/base_page.part.dart';

class BaseBloc<S extends BaseEvent, T extends BaseState>
    extends Bloc<BaseEvent, BaseState> {
  @override
  BaseState get initialState => BaseStateNew();

  @override
  Stream<BaseState> mapEventToState(BaseEvent event) async* {
    LoggerUtils.logger.i('EVENT_START=${event} STATE=${currentState}');
    if (event is BaseEventStartup<S>) {}
/*    if (event is BaseEventUpdate<S>) {
      try {} on Exception catch (error) {}
  }*/
    LoggerUtils.logger.i('EVENT_END=${event} STATE=${currentState}');
  }
}
