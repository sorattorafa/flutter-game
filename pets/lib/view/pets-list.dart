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
    PetModel(name: 'Rafa', id: 1, userId: 2, icon: Icons.sick),
    PetModel(name: 'Rafinha', id: 1, userId: 2, icon: Icons.sick),
    PetModel(name: 'Rafusco', id: 1, userId: 2, icon: Icons.sick),
    PetModel(name: 'Rafa', id: 1, userId: 2, icon: Icons.sick),
    PetModel(name: 'Rafinha', id: 1, userId: 2, icon: Icons.sick),
    PetModel(name: 'Rafusco', id: 1, userId: 2, icon: Icons.sick),
    PetModel(name: 'Rafa', id: 1, userId: 2, icon: Icons.sick),
    PetModel(name: 'Rafinha', id: 1, userId: 2, icon: Icons.sick),
    PetModel(name: 'Rafusco', id: 1, userId: 2, icon: Icons.sick),
    PetModel(name: 'Rafa', id: 1, userId: 2, icon: Icons.sick),
    PetModel(name: 'Rafinha', id: 1, userId: 2, icon: Icons.sick),
    PetModel(name: 'Rafusco', id: 1, userId: 2, icon: Icons.sick),
    PetModel(name: 'Rafa', id: 1, userId: 2, icon: Icons.sick),
    PetModel(name: 'Rafinha', id: 1, userId: 2, icon: Icons.sick),
    PetModel(name: 'Rafusco', id: 1, userId: 2, icon: Icons.sick),
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
                            state: pet.icon,
                            color: Colors.lightBlue,
                            size: 100),
                        Text('Nome do pet: ${pet.name.toString()}')
                      ],
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/petview');
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
