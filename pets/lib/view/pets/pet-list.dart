import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets/cubit/pets/cubit.dart';
import 'package:pets/cubit/pets/state.dart';
import 'package:pets/cubit/users/cubit.dart';
import 'package:pets/widgets/adaptative-refresh-indicator.dart';
import 'package:pets/view/pets/widgets/pet-list-builder.dart';
import 'package:pets/widgets/refresh-scroll-physics.dart';
import 'package:pets/view/pets/widgets/total-pets-section.dart';
import 'package:provider/provider.dart';

class PetList extends StatefulWidget {
  @override
  _PetListState createState() => _PetListState();
}

class _PetListState extends State<PetList> {
  UserCubit? userState;
  PetsCubit? petState;

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      userState = Provider.of<UserCubit>(context, listen: false);
      petState = Provider.of<PetsCubit>(context, listen: false);
      final pets = await petState!.listPetsByUser(userState!.actualUser!.id!);
      print(pets);
    });
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
            CupertinoSliverRefreshControl(
              onRefresh: () async {
                setState(() {
                  context
                      .read<PetsCubit>()
                      .listPetsByUser(userState!.actualUser!.id!);
                });
                return Future.value(true);
              },
              builder: buildAdaptativeRefreshIndicator,
            ),
            BlocBuilder<PetsCubit, PetsState>(builder: (context, state) {
              if (state is LoadedState) {
                return SliverToBoxAdapter(
                  child: Center(
                    child: TotalPetsSection(),
                  ),
                );
              } else {
                return SliverToBoxAdapter();
              }
            }),
            PetBuilder(),
          ],
        ),
      ),
    );
  }
}
