import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets/cubit/pets/cubit.dart';
import 'package:pets/cubit/pets/state.dart';
import 'package:pets/models/pet.dart';
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
              child: Icon(Icons.close),
            ),
          );
        } else if (state is LoadedState) {
          final pets = state.pets;

          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                final pet = pets[index];
                return GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.all(9),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Pet(
                              imageUrl: pet.imageUrl,
                              color: pet.color,
                              name: pet.name,
                              size: 125),
                          Container(
                            width: 210,
                            height: 220,
                            padding: const EdgeInsets.all(12),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('Life',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 12)),
                                  Slider(
                                    min: 0,
                                    max: 100,
                                    value: 50,
                                    activeColor: Colors.red.shade200,
                                    onChanged: (onchanged) {},
                                  ),
                                  Text('Happy',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 12)),
                                  Slider(
                                    min: 0,
                                    max: 100,
                                    value: 50,
                                    activeColor: Colors.orange.shade200,
                                    onChanged: (onchanged) {},
                                  ),
                                  Text('Hungry',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 12)),
                                  Slider(
                                    min: 0,
                                    max: 100,
                                    value: 50,
                                    onChanged: (onchanged) {},
                                  ),
                                ]),
                          ),
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
          return Container();
        }
      },
    );
  }
}
