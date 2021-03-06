import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:pets/providers/user.dart';
import 'package:provider/provider.dart';

class UsersCount extends StatelessWidget {
  const UsersCount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(

        /// Calls `context.watch` to make [Count] rebuild when [Counter] changes.
        '${context.watch<UsersProvider>().usersCount}',
        key: const Key('counterState'),
        style: Theme.of(context).textTheme.headline4);
  }
}
