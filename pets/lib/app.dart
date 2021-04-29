import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets/cubit/pets/cubit.dart';
import 'package:pets/cubit/users/cubit.dart';
import 'package:pets/cubit/users/repository.dart';
import 'package:pets/providers/pets.dart';
import 'package:pets/providers/user.dart';
import 'package:pets/cubit/pets/repository.dart';
import 'package:pets/view/pets/farm.dart';
import 'package:pets/view/pets/new-pet.dart';
import 'package:pets/view/users/login.dart';
import 'package:pets/view/pets/pet.dart';
import 'package:provider/provider.dart';

class PetsApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PetsAppState();
}

class _PetsAppState extends State<PetsApp> {
  void initState() {
    super.initState();
  }
/*
  /// Creates a route with the default animation
  static Route<dynamic> defaultRoute(WidgetBuilder widgetBuilder,
          [RouteSettings settings]) =>
      MaterialPageRoute<dynamic>(builder: widgetBuilder, settings: settings);
*/

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UsersProvider()),
        ChangeNotifierProvider(create: (_) => PetsProvider()),
        BlocProvider<PetsCubit>(
          create: (context) => PetsCubit(
            repository: PetService(
              Dio(),
            ),
          ),
        ),
        BlocProvider<UserCubit>(
          create: (context) => UserCubit(
            repository: UsersServices(
              Dio(),
            ),
          ),
        )
      ],
      child: MaterialApp(
        title: 'Flutter pets',
        initialRoute: '/',
        routes: {
          '/': (context) => FirstScreen(),
          '/second': (context) => SecondScreen(),
          '/petview': (context) => PetInfos(),
          '/newpet': (context) => NewPet(),
        },
        //  onGenerateRoute: PageRouter.generateRoute,
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.deepPurple,
          primaryColor: Colors.purple.shade500,
          scaffoldBackgroundColor: Colors.white,
          primaryTextTheme: TextTheme(
            headline6: TextStyle(color: Colors.grey[800]),
            bodyText2: TextStyle(color: Colors.grey[800]),
            bodyText1: TextStyle(color: Colors.grey[800]),
          ),
          dividerTheme: const DividerThemeData(
            color: Color(0xFFE4E4E4),
            thickness: 1,
          ),
          inputDecorationTheme: const InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(22)),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.all(8),
            filled: true,
            fillColor: Color(0x0A000000),
          ),
          appBarTheme: AppBarTheme(
            color: Colors.deepPurple,
            brightness: Brightness.light,
            iconTheme: IconThemeData(color: Colors.grey[800]),
            elevation: 2.5,
          ),
          buttonColor: Colors.purple.shade300,
          buttonTheme: ButtonThemeData(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22.0),
            ),
            buttonColor: Colors.purple.shade400,
          ),
        ),
      ),
    );
  }
}
