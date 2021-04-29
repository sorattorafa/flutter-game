import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets/cubit/users/repository.dart';
import 'package:pets/cubit/users/state.dart';
import 'package:pets/models/user.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit({required this.repository}) : super(InitialState());

  late UserModel actualUser;
  final UsersServices repository;

  Future<UserState> makeLogin(UserModel user) async {
    try {
      emit(LoadingState());
      final userLogin = await repository.makeLogin(user.email, user.password!);
      actualUser = userLogin;
      emit(LoadedState(actualUser));
      return LoadedSucess();
    } catch (e) {
      emit(ErrorState());
      return ErrorState();
    }
  }
}
