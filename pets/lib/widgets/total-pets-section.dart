import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets/cubit/pets/cubit.dart';
import 'package:pets/models/pet.dart';
import 'package:pets/widgets/pets-counter.dart';
import 'package:provider/provider.dart';

class TotalPetsSection extends StatelessWidget {
  const TotalPetsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      child: Row(
        children: [
          PetsCount(),
          Container(
            padding: const EdgeInsets.all(12),
            child: ElevatedButton(
                onPressed: () async {
                  context.read<PetsCubit>().addPet(PetModel(
                      name: 'Rafinha',
                      id: 1,
                      userId: 2,
                      imageUrl: 'assets/images/dog/happy.png',
                      color: Colors.green));
                },
                child: Text('Novo pet')),
          ),
        ],
      ),
    );
  }
}
