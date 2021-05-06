import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pets/cubit/pets/cubit.dart';
import 'package:pets/cubit/pets/repository.dart';
import 'package:pets/cubit/pets/state.dart';
import 'package:pets/models/pet.dart';
import 'package:pets/models/user.dart';

class MockRepository extends Mock implements PetService {}

void main() {
  late MockRepository petService;
  late PetsCubit moviesCubit;

  final pets = [
    PetModel(
        name: 'Pet',
        imageUrl: 'url',
        clean: null,
        id: 1,
        color: Colors.green,
        lastUpdated: null,
        happy: 100,
        hungry: 100,
        sleep: 100,
        life: 100,
        userId: 1),
  ];

  final user = UserModel(
    email: 'rafael@soratto.com',
    id: 1,
  );

  setUp(() {
    petService = MockRepository();
    when(() => petService.listPetsByUser(user.id!)).thenAnswer(
      (_) async => pets,
    );
  });

  test('Emits movies when repository answer correctly', () async {
    moviesCubit = PetsCubit(repository: petService);

    await expectLater(
      moviesCubit.stream,
      emits(
        LoadedState(pets),
      ),
    );
  });
}
