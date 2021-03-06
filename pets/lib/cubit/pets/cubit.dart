import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets/cubit/pets/state.dart';
import 'package:pets/models/pet.dart';
import 'package:pets/cubit/pets/repository.dart';
import 'dart:math';

class PetsCubit extends Cubit<PetsState> {
  PetsCubit({required this.repository}) : super(InitialState());

  List<PetModel> _pets = [];

  final PetService repository;

  int getPetNumber(int petId) =>
      _pets.indexWhere((element) => element.id == petId) + 1;

  Future<void> updatePetsAttributes(
      List<PetModel> _pets, List<PetModel> pets) async {
    for (var _pet in _pets) {
      final _petId = _pet.id;
      final updatedPet = pets.firstWhere((e) => e.id == _petId);
      if (updatedPet.id == _pet.id) {
        await updatePetAttribute(updatedPet, _pet);
      }
    }
  }

  Future<dynamic> listPetsByUser(int? userId) async {
    if (userId == null) {
      emit(EmptyState());
      return;
    } else {
      try {
        emit(LoadingState());
        final pets = await repository.listPetsByUser(userId);

        _pets = pets;
        if (_pets.isNotEmpty && pets.isNotEmpty) {
          await updatePetsAttributes(_pets, pets);
        }
        if (_pets.isNotEmpty) {
          emit(LoadedState(_pets));
        } else {
          emit(EmptyState());
        }
      } catch (e) {
        emit(ErrorState());
      }
    }
  }

  void addPet(PetModel pet) async {
    try {
      emit(LoadingState());
      final result = await repository.addPet(pet);
      _pets.add(result);
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

  double random() {
    final list = [0.8, 0.85, 0.9, 0.95, 1.1, 1.2, 1.15];
    list.shuffle();
    return list.elementAt(0);
  }

  Future<void> updatePetAttribute(PetModel updatedPet, PetModel _pet) async {
    final today = DateTime.now();
    final lastUpdated = DateTime.parse(updatedPet.lastUpdated!);

    final deltaTime = (pow(lastUpdated.difference(today).inHours, 2) / 32);

    final lifeVariation = (_pet.life * (random())) * deltaTime;
    final hungryVariation = (_pet.hungry * random()) * deltaTime;
    final happyVariation = (_pet.happy * random()) * deltaTime;

    _pet.hungry -= hungryVariation.toInt();
    _pet.happy -= happyVariation.toInt();
    _pet.life -= lifeVariation.toInt();
    _pet.sleep -= lifeVariation.toInt();

    if (_pet.happy <= 0 && _pet.happy <= 0 && _pet.hungry <= 0) {
      _pet.state = 'dead';
      _pet.petAction('kill');
    } else if (_pet.life < 25) {
      _pet.state = 'sick';
      _pet.petAction('sick');
    } else if (_pet.happy < 25) {
      _pet.state = 'sad';
      _pet.petAction('sick');
    } else if (_pet.happy <= 40 && _pet.hungry < 40) {
      _pet.state = 'tired';
      _pet.petAction('tired');
    }

    await repository.updatePet(_pet);
  }
}
