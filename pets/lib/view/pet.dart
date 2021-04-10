import 'package:flutter/material.dart';
import 'package:pets/widgets/pet.dart';

class PetInfos extends StatefulWidget {
  @override
  _PetInfosState createState() => _PetInfosState();
}

class _PetInfosState extends State<PetInfos> {
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Pet: numero 1'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: 360,
              height: 360,
              child: Pet(state: Icons.sick, color: Colors.red, size: 250),
            ),
          ],
        ),
      ),
    );
  }
}
