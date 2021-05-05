import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets/cubit/pets/state.dart';
import 'package:pets/models/pet.dart';
import 'package:pets/cubit/pets/repository.dart';

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

  Future<dynamic> listPetsByUser(int userId) async {
    try {
      emit(LoadingState());
      final pets = await repository.listPetsByUser(userId);

      _pets = _pets.isNotEmpty ? _pets : pets;
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

  Future<void> updatePetAttribute(PetModel updatedPet, PetModel _pet) async {
    final lastEat = DateTime.parse(updatedPet.lastEat!);
    final today = DateTime.now().toUtc();
    final deltaTimeEat = today.subtract(Duration(
        days: lastEat.day, hours: lastEat.hour, minutes: lastEat.minute));
    final deltaTime = deltaTimeEat.hour + (deltaTimeEat.minute / 60);
    final hungryVariation = (_pet.hungry * 0.8) * deltaTime;

    final lastPlay = DateTime.parse(updatedPet.lastPlay!);
    final deltaTimePlay = today.subtract(Duration(
        days: lastPlay.day, hours: lastPlay.hour, minutes: lastPlay.minute));
    final deltaTimePlayed = deltaTimePlay.hour + (deltaTimePlay.minute / 60);
    final playVariation = (_pet.happy * 0.8) * deltaTimePlayed;

    final lastSleep = DateTime.parse(updatedPet.lastSleep!);
    final deltaTimeSleep = today.subtract(Duration(
        days: lastSleep.day, hours: lastSleep.hour, minutes: lastSleep.minute));
    final deltaTimeSleeped = deltaTimeSleep.hour + (deltaTimeSleep.minute / 60);
    final sleepVariation = (_pet.sleep * 0.8) * deltaTimeSleeped;

    _pet.hungry = _pet.hungry - hungryVariation.toInt();
    _pet.happy = _pet.happy - playVariation.toInt();
    _pet.sleep = _pet.sleep - sleepVariation.toInt();

    await repository.updatePet(_pet);
  }
}
