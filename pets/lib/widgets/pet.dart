import 'package:flutter/material.dart';

class PetSick extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 360,
      child: Icon(Icons.sick, size: 360, color: Colors.red),
    );
  }
}
