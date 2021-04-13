import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pets/models/pet.dart';
import 'package:pets/widgets/adaptative-refresh-indicator.dart';
import 'package:pets/widgets/pet.dart';
import 'package:pets/widgets/refresh-scroll-physics.dart';

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
    Navigator.pushNamed(context, '/petview',
        arguments: PetModel(
            name: pet.name,
            imageUrl: pet.imageUrl,
            id: pet.id,
            userId: pet.userId,
            color: pet.color));
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
                  return Future.value(true);
                },
                builder: buildAdaptativeRefreshIndicator,
              ),
            SliverToBoxAdapter(
              child: Column(children: [
                for (final pet in petmodels)
                  GestureDetector(
                    child: Row(
                      children: [
                        Pet(
                            imageUrl: pet.imageUrl,
                            color: pet.color,
                            size: 100),
                        SizedBox(
                          width: 30,
                        ),
                        Column(
                          children: [
                            Text(
                              'Nome do pet: ${pet.name.toString()}',
                              style: TextStyle(
                                  backgroundColor: Colors.deepPurple.shade100,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  return openPet(pet);
                                },
                                child: Text('Ver mais'))
                          ],
                        ),
                      ],
                    ),
                    onTap: () {
                      //   print(pet);
                      return openPet(pet);
                    },
                  ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}