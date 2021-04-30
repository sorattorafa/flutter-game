import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets/cubit/users/repository.dart';
import 'package:pets/cubit/users/state.dart';
import 'package:pets/models/user.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit({required this.repository}) : super(InitialState());

  UserModel? actualUser;
  final UsersServices repository;

  UserState returnError(Object e) {
    var error;
    if (e == UsersServicesError.UNKNOWN_ERROR) {
      error = NetworkErrorState();
    } else {
      error = ErrorState();
    }
    emit(error);
    return error;
  }

  void clearActualUser() {
    actualUser = null;
  }

  Future<UserState> makeLogin(UserModel user) async {
    try {
      emit(LoadingState());
      final userLoginResult =
          await repository.makeLogin(user.email, user.password!);
      final userLogin = userLoginResult.elementAt(0);
      actualUser =
          UserModel(email: userLogin.elementAt(1), id: userLogin.elementAt(0));
      emit(LoadedState(actualUser!));
      return LoginSucess();
    } catch (e) {
      return returnError(e);
    }
  }

  Future<UserState> createUser(UserModel user) async {
    try {
      emit(LoadingState());
      final userLoginResult =
          await repository.createUser(user.email, user.password!);
      final userLogin = userLoginResult.elementAt(0);
      actualUser =
          UserModel(email: userLogin.elementAt(1), id: userLogin.elementAt(0));
      emit(LoadedState(actualUser!));
      return LoginSucess();
    } catch (e) {
      return returnError(e);
    }
  }
}
