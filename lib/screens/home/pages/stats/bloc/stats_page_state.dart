import 'package:equatable/equatable.dart';

abstract class StatsPageState extends Equatable {
  const StatsPageState();

  @override
  List<Object> get props => [];
}

class StatsPageInitial extends StatsPageState {}

class StatsPageLoading extends StatsPageState {}

class StatsPageSuccess extends StatsPageState {
  final String text;

  StatsPageSuccess(this.text);

  @override
  List<Object> get props => [text];
}

class StatsPageFailure extends StatsPageState {
  final String message;

  StatsPageFailure(this.message);

  @override
  List<Object> get props => [message];
}
