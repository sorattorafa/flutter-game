import 'package:equatable/equatable.dart';
import 'package:pets/models/user.dart';

abstract class UserState extends Equatable {}

class InitialState extends UserState {
  @override
  List<Object> get props => [];
}

class LoadingState extends UserState {
  @override
  List<Object> get props => [];
}

class LoadedSucess extends UserState {
  @override
  List<Object> get props => [];
}

class LoadedState extends UserState {
  LoadedState(this.user);

  final UserModel user;

  @override
  List<Object> get props => [user];
}

class ErrorState extends UserState {
  @override
  List<Object> get props => [];
}
