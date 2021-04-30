import 'package:flutter/material.dart';
import 'package:pets/cubit/pets/cubit.dart';
import 'package:pets/cubit/users/cubit.dart';
import 'package:pets/providers/pets.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            child: Icon(Icons.person, size: 200, color: Colors.black),
          ),
          Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                Text(
                    'total de pets: ${context.watch<PetsCubit>().getPetsLength}'),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<UserCubit>().clearActualUser();
              context.read<PetsCubit>().clearPets();
              context.read<PetsProvider>().clearProvider();
              Navigator.pushReplacementNamed(context, '/');
            },
            child: Text('Logout'),
          ),
        ],
      ),
    );
  }
}
