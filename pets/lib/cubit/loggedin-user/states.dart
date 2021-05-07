import 'package:equatable/equatable.dart';

abstract class LoggedinUser extends Equatable {}

class Logged extends LoggedinUser {
  Logged(this.userId);

  final int userId;

  @override
  List<Object> get props => [userId];
}

class EmptyUser extends LoggedinUser {
  @override
  List<Object> get props => [];
}