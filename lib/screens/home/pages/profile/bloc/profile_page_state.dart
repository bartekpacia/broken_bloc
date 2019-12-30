import 'package:equatable/equatable.dart';
import 'package:bloc_strange_behavior/remote/models/user.dart';

abstract class ProfilePageState extends Equatable {
  const ProfilePageState();

  @override
  List<Object> get props => [];
}
class ProfilePageLoading extends ProfilePageState {}

class ProfilePageSuccess extends ProfilePageState {
  final User user;

  ProfilePageSuccess(this.user);

  @override
  List<Object> get props => [user];
}

class ProfilePageEditing extends ProfilePageState {
  final User user;

  ProfilePageEditing(this.user);

  @override
  List<Object> get props => [user];
}

class ProfilePageFailure extends ProfilePageState {
  final String message;

  ProfilePageFailure(this.message);

  @override
  List<Object> get props => [message];
}
