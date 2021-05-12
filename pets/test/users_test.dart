import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pets/cubit/users/cubit.dart';
import 'package:pets/cubit/users/repository.dart';
import 'package:pets/models/user.dart';

class MockRepository extends Mock implements UsersServices {}

void main() {
  group('Users Cubit', () {
    late MockRepository userService;
    late UserCubit userCubit;

    setUp(() {
      userService = MockRepository();
    });
    test('default is empty', () {
      userCubit = UserCubit(repository: userService);
      expect(userCubit.state.props.length, 0);
    });

    test('Actual user start with null', () {
      var cubit = UserCubit(repository: userService);
      expect(cubit.actualUser, null);
    });
    test('add actual user', () {
      final myUser = UserModel(id: 1, email: 'rafa@gmail.com');
      var cubit = UserCubit(repository: userService);
      cubit.actualUser = myUser;
      expect(cubit.actualUser, myUser);
    });
    test('add actual user', () {
      var cubit = UserCubit(repository: userService);
      expect(cubit.state.props.length, 0);
    });
    
  });
}
