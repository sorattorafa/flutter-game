import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:pets/cubit/pets/cubit.dart';
//import 'package:pets/providers/pets.dart';
import 'package:provider/provider.dart';

class PetsCount extends StatelessWidget {
  const PetsCount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(

        /// Calls `context.watch` to make [Count] rebuild when [Counter] changes.
        'Total de pets ${context.watch<PetsCubit>().getPetsLength}',
        key: const Key('counterState'),
        style: Theme.of(context).textTheme.headline5);
  }
}
