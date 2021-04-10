import 'package:flutter/material.dart';
import 'package:pets/view/profile.dart';
import 'package:pets/view/pets-list.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  BottomNavigationBarItem getBottomBarItem(String title, IconData icon) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: title,
    );
  }

  Widget bottomBar(BuildContext context) {
    const IconData pets = IconData(0xe90e, fontFamily: 'MaterialIcons');
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        getBottomBarItem('Meus pets', pets),
        getBottomBarItem('Perfil', Icons.person),
      ],
      currentIndex: selectedIndex,
      onTap: (value) {
        setState(() {
          if (selectedIndex != value) {
            selectedIndex = value;
          }
        });
      },
      unselectedItemColor: Theme.of(context).primaryTextTheme.headline6.color,
    );
  }

  Widget renderScreens(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return PetList();
      case 1:
        return Profile();
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    const IconData pets = IconData(0xe90e, fontFamily: 'MaterialIcons');
    return Scaffold(
      bottomNavigationBar: bottomBar(context),
      appBar: AppBar(
        title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(
            pets,
            color: Colors.black,
            size: 20.0,
            key: Key('icon2'),
          ),
          SizedBox(width: 5),
          Text(
            'Pets Game',
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(width: 5),
          Icon(
            pets,
            color: Colors.black,
            size: 20.0,
            key: Key('icon1'),
          ),
        ]),
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: renderScreens(selectedIndex),
      ),
    );
  }
}
