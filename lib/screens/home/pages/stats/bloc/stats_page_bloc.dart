import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_strange_behavior/failure.dart';
import 'package:bloc_strange_behavior/remote/repositories/user_repository.dart';
import 'package:logging/logging.dart';

import './bloc.dart';

class StatsPageBloc extends Bloc<StatsPageEvent, StatsPageState> {
  final UserRepository userRepository;

  StatsPageBloc({this.userRepository}) : assert(userRepository != null);

  @override
  StatsPageState get initialState => StatsPageInitial();

  @override
  Stream<StatsPageState> mapEventToState(StatsPageEvent event) async* {
    if (event is StatsPageShowed) {
      yield StatsPageLoading();
      try {
        yield StatsPageSuccess("stats page success");
      } on Failure catch (failure) {
        Logger.root.severe(failure.message);
        yield StatsPageFailure(failure.message);
      } on Exception catch (exception) {
        Logger.root.severe(exception.toString());
        yield StatsPageFailure(exception.toString());
      }
    }
  }
}
