import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets/cubit/pets/cubit.dart';
import 'package:pets/widgets/adaptative-refresh-indicator.dart';
import 'package:pets/widgets/pet-list.dart';
import 'package:pets/widgets/refresh-scroll-physics.dart';
import 'package:pets/widgets/total-pets-section.dart';
import 'package:provider/provider.dart';

class PetList extends StatefulWidget {
  @override
  _PetListState createState() => _PetListState();
}

class _PetListState extends State<PetList> {
  int selectedIndex = 0;
  bool isInitializing = true;

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
                  setState(() {
                    context.read<PetsCubit>().listPetsByUser();
                  });
                  return Future.value(true);
                },
                builder: buildAdaptativeRefreshIndicator,
              ),
            SliverToBoxAdapter(
              child: Column(children: [
                TotalPetsSection(),
              ]),
            ),
            PetBuilder(),
          ],
        ),
      ),
    );
  }
}
