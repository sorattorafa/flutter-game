import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets/cubit/pets/cubit.dart';
import 'package:pets/cubit/pets/state.dart';
import 'package:pets/models/pet.dart';
import 'package:pets/view/pets/widgets/new-pet-container.dart';
import 'package:pets/view/pets/widgets/pet.dart';

class PetBuilder extends StatefulWidget {
  const PetBuilder({
    Key? key,
  }) : super(key: key);

  @override
  _PetBuilderState createState() => _PetBuilderState();
}

class _PetBuilderState extends State<PetBuilder> {
  void openPet(PetModel pet) {
    Navigator.pushNamed(context, '/petview', arguments: pet);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PetsCubit, PetsState>(
      builder: (context, state) {
        if (state is LoadingState) {
          return SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is ErrorState) {
          return SliverToBoxAdapter(
            child: Center(
              child: Column(children: [Icon(Icons.close)]),
            ),
          );
        } else if (state is EmptyState) {
          return SliverToBoxAdapter(
            child: Center(
                child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    'Create your first pet',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                NewPetWidget(),
              ],
            )),
          );
        } else if (state is LoadedState) {
          final pets = state.pets;
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                final pet = pets[index];
                return GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Pet(pet: pet, size: 125),
                        ]),
                  ),
                  onTap: () {
                    //   print(pet);
                    return openPet(pet);
                  },
                );
              },
              childCount: pets.length,
            ),
          );
        } else {
          return SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
