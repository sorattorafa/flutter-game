//import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pets/cubit/pets/cubit.dart';
import 'package:pets/cubit/pets/repository.dart';

class MockRepository extends Mock implements PetService {}

void main() {
  late MockRepository petService;
  late PetsCubit petsCubit;

  setUp(() {
    petService = MockRepository();
    petsCubit = PetsCubit(repository: petService);
  });

  test('Start with  0 pets', () async {
    expect(petsCubit.getPetsLength, 0);
  });
}
