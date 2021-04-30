import 'package:equatable/equatable.dart';
import 'package:pets/models/pet.dart';

abstract class PetsState extends Equatable {}

class InitialState extends PetsState {
  @override
  List<Object> get props => [];
}

class LoadingState extends PetsState {
  @override
  List<Object> get props => [];
}

class EmptyState extends PetsState {
  @override
  List<Object> get props => [];
}

class LoadedState extends PetsState {
  LoadedState(this.pets);

  final List<PetModel> pets;

  @override
  List<Object> get props => [pets];
}

class ErrorState extends PetsState {
  @override
  List<Object> get props => [];
}
