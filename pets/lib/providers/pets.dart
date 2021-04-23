import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PetsProvider with ChangeNotifier, DiagnosticableTreeMixin {
  int _petsCount = 0;

  bool _hasSelectedPet = false;

  bool get hasSelectedPet => _hasSelectedPet;

  int get petsCount => _petsCount;

  void setSelectedPet() {
    _hasSelectedPet = !_hasSelectedPet;
    notifyListeners();
  }

  void increment() {
    _petsCount++;
    notifyListeners();
  }

  /// Makes `petsProvider` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('petsCount', petsCount));
  }
}
