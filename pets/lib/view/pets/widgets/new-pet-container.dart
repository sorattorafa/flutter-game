import 'package:flutter/material.dart';
import 'package:pets/cubit/pets/cubit.dart';
import 'package:pets/cubit/users/cubit.dart';
import 'package:pets/models/pet.dart';
import 'package:pets/providers/pets.dart';
import 'package:pets/widgets/form-field.dart';
import 'package:pets/view/pets/widgets/pet-selection-item.dart';

import 'package:provider/provider.dart';

class NewPetWidget extends StatefulWidget {
  const NewPetWidget({
    this.willPop = false,
    Key? key,
  }) : super(key: key);

  final bool willPop;
  @override
  _NewPetWidgetState createState() => _NewPetWidgetState();
}

class _NewPetWidgetState extends State<NewPetWidget> {
  var nameController = TextEditingController(text: '');

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Form(
            key: _formKey,
            child: FormItem(
              formFieldName: 'pet name',
              controller: nameController,
              suffix: Visibility(
                visible: true,
                child: IconButton(
                  icon: const Icon(Icons.cancel),
                  color: Colors.purple.shade500,
                  onPressed: () {
                    nameController = TextEditingController(text: '');
                  },
                ),
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
                  //print(context.read<UserCubit>().actualUser!.id);
                  if (_formKey.currentState!.validate()) {
                    context.read<PetsCubit>().addPet(PetModel(
                          id: -1,
                          name: nameController.text,
                          userId: context.read<UserCubit>().actualUser!.id,
                          imageUrl: context.read<PetsProvider>().selectedPet,
                          color: Colors.lightGreen,
                          happy: 100,
                          hungry: 100,
                          sleep: 100,
                          life: 100,
                          lastEat: DateTime.now(),
                          lastSleep: DateTime.now(),
                          lastPlay: DateTime.now(),
                        ));
                    if (widget.willPop) {
                      Navigator.pop(context);
                    }
                  }
                },
                child: Text('Create pet')),
          ),
        ],
      ),
    );
  }
}
