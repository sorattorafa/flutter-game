import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets/cubit/pets/state.dart';
import 'package:pets/models/pet.dart';
import 'package:pets/cubit/pets/repository.dart';

class PetsCubit extends Cubit<PetsState> {
  PetsCubit({required this.repository}) : super(InitialState());

  List<PetModel> _pets = [];

  final PetService repository;

  Future<dynamic> listPetsByUser(int userId) async {
    try {
      //  emit(LoadingState());
      emit(LoadingState());
      final pets = await repository.listPetsByUser(userId);
      _pets = _pets.isNotEmpty ? _pets : pets;
      if (pets.isNotEmpty) {
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
      final result = await repository.addPet(pet);
      if (result != null) {
        _pets.add(pet);
      }
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
