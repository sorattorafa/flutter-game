import 'package:flutter/material.dart';
import 'package:pets/widgets/pet.dart';

class Pet extends StatefulWidget {
  @override
  _PetState createState() => _PetState();
}

class _PetState extends State<Pet> {
  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            width: 360,
            height: 360,
            child: Icon(Icons.sick, size: 360, color: Colors.blue),
          ),
        ],
      ),
    );
  }
}
