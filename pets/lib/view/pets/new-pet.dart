import 'package:flutter/material.dart';
import 'package:pets/view/pets/widgets/new-pet-container.dart';

class NewPet extends StatefulWidget {
  @override
  _NewPetState createState() => _NewPetState();
}

class _NewPetState extends State<NewPet> {
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cadastre seu pet',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: NewPetWidget(
        willPop: true,
      ),
    );
  }
}
