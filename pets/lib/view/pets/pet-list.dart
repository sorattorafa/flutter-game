import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pets/models/pet.dart';
import 'package:pets/providers/pets.dart';
import 'package:pets/widgets/adaptative-refresh-indicator.dart';
import 'package:pets/widgets/pet.dart';
import 'package:pets/widgets/pets-counter.dart';
import 'package:pets/widgets/refresh-scroll-physics.dart';
import 'package:provider/provider.dart';

class PetList extends StatefulWidget {
  @override
  _PetListState createState() => _PetListState();
}

class _PetListState extends State<PetList> {
  int selectedIndex = 0;
  bool isInitializing = true;

  final petmodels = [
    PetModel(
        name: 'Rafa',
        id: 1,
        userId: 2,
        imageUrl: 'assets/images/frog/happy.png',
        color: Colors.lightGreen),
    PetModel(
        name: 'Rafinha',
        id: 1,
        userId: 2,
        imageUrl: 'assets/images/frog/sad.png',
        color: Colors.brown),
    PetModel(
        name: 'Rafusco',
        id: 1,
        userId: 2,
        imageUrl: 'assets/images/frog/normal.png',
        color: Colors.grey),
    PetModel(
        name: 'Rafa',
        id: 1,
        userId: 2,
        imageUrl: 'assets/images/frog/tired.png',
        color: Colors.lightGreen),
    PetModel(
        name: 'Rafinha',
        id: 1,
        userId: 2,
        imageUrl: 'assets/images/dog-solid.svg',
        color: Colors.brown),
    PetModel(
        name: 'Rafusco',
        id: 1,
        userId: 2,
        imageUrl: 'assets/images/cat-solid.svg',
        color: Colors.grey),
    PetModel(
        name: 'Rafusco',
        id: 1,
        userId: 2,
        imageUrl: 'assets/images/cat-solid.svg',
        color: Colors.grey),
    PetModel(
        name: 'Rafusco',
        id: 1,
        userId: 2,
        imageUrl: 'assets/images/cat-solid.svg',
        color: Colors.grey),
    PetModel(
        name: 'Rafusco',
        id: 1,
        userId: 2,
        imageUrl: 'assets/images/cat-solid.svg',
        color: Colors.grey),
    PetModel(
        name: 'Rafusco',
        id: 1,
        userId: 2,
        imageUrl: 'assets/images/cat-solid.svg',
        color: Colors.grey),
  ];
  @override
  void initState() {
    super.initState();

    isInitializing = false;
  }

  @override
  void dispose() {
    super.dispose();
  }

  void openPet(PetModel pet) {
    Navigator.pushNamed(context, '/petview', arguments: pet);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        body: CustomScrollView(
          physics: const RefreshScrollPhysics(),
          slivers: <Widget>[
            if (!isInitializing)
              CupertinoSliverRefreshControl(
                onRefresh: () async {
                  setState(() {});
                  return Future.value(true);
                },
                builder: buildAdaptativeRefreshIndicator,
              ),
            SliverToBoxAdapter(
              child: Column(children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  child: Row(
                    children: [
                      PetsCount(),
                      Container(
                        padding: const EdgeInsets.all(12),
                        child: ElevatedButton(
                            onPressed: () async {
                              Navigator.pushNamed(context, '/newpet');
                              context.read<PetsProvider>().increment();
                            },
                            child: Text('Novo pet')),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  final pet = petmodels[index];
                  return GestureDetector(
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Pet(
                                imageUrl: pet.imageUrl,
                                color: pet.color,
                                name: pet.name,
                                size: 150),
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
                childCount: petmodels.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
