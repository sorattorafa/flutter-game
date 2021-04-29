import 'package:flutter/material.dart';
import 'package:pets/cubit/pets/cubit.dart';
import 'package:pets/models/pet.dart';
import 'package:pets/widgets/form-field.dart';
import 'package:pets/widgets/pet-selection-item.dart';

import 'package:provider/provider.dart';

class NewPet extends StatefulWidget {
  @override
  _NewPetState createState() => _NewPetState();
}

class _NewPetState extends State<NewPet> {
  TextEditingController nameController = TextEditingController(text: '');
  bool enabled = true;
  bool clicked = false;

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
      body: Container(
        padding: EdgeInsets.all(18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 15, top: 15),
              child: Text(
                'Pet name',
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            FormItem(
              formFieldName: 'Pet name',
              controller: nameController,
              suffix: Visibility(
                visible: true,
                child: IconButton(
                  icon: const Icon(Icons.cancel),
                  color: Colors.purple.shade500,
                  onPressed: () {
                    setState(() {
                      nameController = TextEditingController(text: '');
                    });
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 15, top: 15),
              child: Text(
                'Pet type',
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Wrap(
              children: [
                PetSelectionItem(
                  imageUrl: 'assets/images/cat/happy.png',
                  color: Colors.purple.shade300,
                ),
                PetSelectionItem(
                  imageUrl: 'assets/images/dog/happy.png',
                  color: Colors.purple.shade300,
                ),
                PetSelectionItem(
                  imageUrl: 'assets/images/fish/happy.png',
                  color: Colors.purple.shade300,
                ),
                PetSelectionItem(
                  imageUrl: 'assets/images/frog/happy.png',
                  color: Colors.purple.shade300,
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(12),
              child: ElevatedButton(
                  onPressed: () async {
                    context.read<PetsCubit>().addPet(PetModel(
                        name: 'Rafa',
                        id: 1,
                        userId: 2,
                        imageUrl: 'assets/images/frog/happy.png',
                        color: Colors.lightGreen));
                    Navigator.pop(context);
                  },
                  child: Text('Create pet')),
            ),
          ],
        ),
      ),
    );
  }
}
