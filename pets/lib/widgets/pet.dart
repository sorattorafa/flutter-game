import 'package:flutter/material.dart';

class PetSick extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 250,
      child: Icon(Icons.sick, size: 250, color: Colors.red),
    );
  }
}
