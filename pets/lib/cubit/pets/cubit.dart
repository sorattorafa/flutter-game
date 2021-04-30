import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets/cubit/pets/state.dart';
import 'package:pets/models/pet.dart';
import 'package:pets/cubit/pets/repository.dart';

class PetsCubit extends Cubit<PetsState> {
  PetsCubit({required this.repository}) : super(InitialState()) {
    listPetsByUser();
  }

  List<PetModel> _pets = [];

  final PetService repository;

  void listPetsByUser() async {
    try {
      emit(LoadingState());
      final pets = await repository.listPetsByUser();
      _pets = pets;
      if (pets.length > 1) {
        emit(LoadedState(pets));
      } else {
        emit(EmptyState());
      }
    } catch (e) {
      emit(ErrorState());
    }
  }

  void addPet(PetModel pet) async {
    try {
      emit(LoadingState());
      _pets.add(pet);
      emit(LoadedState(_pets));
    } catch (e) {
      emit(ErrorState());
    }
  }

  void clearPets() async {
    try {
      emit(LoadingState());
      _pets.clear();
      emit(LoadedState(_pets));
    } catch (e) {
      emit(ErrorState());
    }
  }

  get getPetsLength => _pets.length;
}
