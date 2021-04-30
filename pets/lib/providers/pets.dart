import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PetsProvider with ChangeNotifier, DiagnosticableTreeMixin {
  int _petsCount = 0;

  String _selectedPet = 'assets/images/cat/happy.png';

  String get selectedPet => _selectedPet;

  int get petsCount => _petsCount;

  void setSelectedPet(String pet) {
    _selectedPet = pet;
    notifyListeners();
  }

  void increment() {
    _petsCount++;
    notifyListeners();
  }

  void clearProvider(){
    _petsCount = 0 ;
  }
  /// Makes `petsProvider` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('petsCount', petsCount));
  }
}
