import 'package:flutter/material.dart';

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
            width: 360,
            height: 360,
            child: Icon(Icons.person, size: 360, color: Colors.black),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(44),
            child: Column(
              children: [
                Text('total de petes: 10'),
                Text('total de petes doentes: 10'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/');
              },
              child: Text('Logout'),
            ),
          ),
        ],
      ),
    );
  }
}
