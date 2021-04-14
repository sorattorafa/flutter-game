import 'package:flutter/material.dart';
import 'package:pets/view/pets/farm.dart';
import 'package:pets/view/users/login.dart';
import 'package:pets/view/pets/pet.dart';

import 'flavor-config.dart';

void main() {
  FlavorConfig(
      flavor: Flavor.USER_DEV,
      values: FlavorValues(baseUrl: 'http://127.0.0.1:5000/'));
  runApp(PetsApp());
}

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
    return MaterialApp(
      title: 'Flutter pets',
      initialRoute: '/',
      routes: {
        '/': (context) => FirstScreen(),
        '/second': (context) => SecondScreen(),
        '/petview': (context) => PetInfos(),
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
          color: Colors.purple.shade700,
          brightness: Brightness.light,
          iconTheme: IconThemeData(color: Colors.grey[800]),
          elevation: 2.5,
        ),
        buttonColor: Colors.purple.shade500,
        buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22.0),
          ),
          buttonColor: Colors.purple.shade500,
        ),
      ),
    );
  }
}
