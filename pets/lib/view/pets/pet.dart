import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pets/cubit/pets/cubit.dart';
import 'package:pets/cubit/users/cubit.dart';
import 'package:pets/models/pet.dart';
import 'package:pets/view/pets/widgets/pet-expanded.dart';
import 'package:pets/widgets/adaptative-refresh-indicator.dart';
import 'package:pets/widgets/refresh-scroll-physics.dart';
import 'package:provider/provider.dart';

class PetInfos extends StatefulWidget {
  @override
  _PetInfosState createState() => _PetInfosState();
}

class _PetInfosState extends State<PetInfos> {
  int selectedIndex = 0;
  late PetsCubit petState;
  late UserCubit userState;

  @override
  void initState() {
    petState = Provider.of<PetsCubit>(context, listen: false);
    userState = Provider.of<UserCubit>(context, listen: false);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as PetModel;
    final petNumber = petState.getPetNumber(args.id);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pet número $petNumber: ${args.name}',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Scaffold(
          body:
              CustomScrollView(physics: const RefreshScrollPhysics(), slivers: [
            CupertinoSliverRefreshControl(
              onRefresh: () async {
                setState(() {
                  context
                      .read<PetsCubit>()
                      .listPetsByUser(userState.actualUser!.id!);
                });
                return Future.value(true);
              },
              builder: buildAdaptativeRefreshIndicator,
            ),
            SliverToBoxAdapter(
              child: Container(
                width: 360,
                height: 360,
                child: PetExpanded(
                  pet: args,
                  size: 175,
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
