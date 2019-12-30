import 'package:equatable/equatable.dart';
import 'package:bloc_strange_behavior/remote/models/user.dart';

abstract class ProfilePageEvent extends Equatable {
  const ProfilePageEvent();

  @override
  List<Object> get props => null;
}

class ProfilePageShowed extends ProfilePageEvent {}

class ProfilePageEditStarted extends ProfilePageEvent {}

class ProfilePageEditSubmitted extends ProfilePageEvent {
  final User user;

  ProfilePageEditSubmitted(this.user);

  @override
  List<Object> get props => [user];
}
