import 'package:flutter/material.dart';
import 'package:pets/models/pet.dart';
import 'package:pets/view/pets/widgets/pet.dart';

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
    final args = ModalRoute.of(context)!.settings.arguments as PetModel;

    return Scaffold(
      appBar: AppBar(
        title: Text('Pet: numero: ${args.id}'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: 360,
              height: 360,
              child: Pet(
                imageUrl: args.imageUrl,
                color: args.color,
                size: 250,
                name: args.name,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
