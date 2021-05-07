import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets/cubit/loggedin-user/states.dart';
import 'package:pets/cubit/users/cubit.dart';

class LoggedinUserProvider extends Cubit<LoggedinUser> {
  LoggedinUserProvider(this._usersCubit, this._userId) : super(EmptyUser());

  // The cache is cleared when this ProxyProvider updates

  UserCubit? _usersCubit;
  String? _userId;  

  void clearProvider() {
    _userId = null;
  }

  String? getMovieUrl() {
    return _userId;
  }

  int? getUserId() {
    final userId = _usersCubit!.actualUser!.id;

    return userId;
  }

  set userId(int userId) {
    userId = userId;
    emit(Logged(userId));
  }
}
