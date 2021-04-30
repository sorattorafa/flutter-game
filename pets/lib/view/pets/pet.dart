import 'package:flutter/material.dart';
import 'package:pets/cubit/pets/cubit.dart';
import 'package:pets/models/pet.dart';
import 'package:pets/view/pets/widgets/pet.dart';
import 'package:provider/provider.dart';

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
    final petState = Provider.of<PetsCubit>(context, listen: false);
    final petNumber = petState.getPetNumber(args.id);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pet: numero: $petNumber',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: 360,
              height: 360,
              child: Pet(
                pet: args,
                size: 175,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
