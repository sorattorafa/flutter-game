import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class UsersProvider with ChangeNotifier, DiagnosticableTreeMixin {
  int _usersCount = 0;

  int get usersCount => _usersCount;

  void increment() {
    _usersCount++;
    notifyListeners();
  }

  /// Makes `UsersProvider` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('usersCount', usersCount));
  }
}
