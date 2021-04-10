import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                GestureDetector(
                  child: Pet(
                      state: Icons.sick, color: Colors.lightBlue, size: 250),
                  onTap: () {
                    Navigator.pushNamed(context, '/petview');
                  },
                ),
                Pet(state: Icons.sick, color: Colors.lightBlue, size: 150),
                Pet(state: Icons.sick, color: Colors.lightBlue, size: 250),
                Pet(state: Icons.sick, color: Colors.lightBlue, size: 250),
                Pet(state: Icons.sick, color: Colors.lightBlue, size: 250),
                Pet(state: Icons.sick, color: Colors.lightBlue, size: 250),
                Pet(state: Icons.sick, color: Colors.lightBlue, size: 250),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
