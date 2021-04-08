import 'package:flutter/material.dart';
import 'package:pets/widgets/pet.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Center(
        child: Column(
          children: [
            PetSick(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Navigator.pop(context);
                    // Navigate back to first screen when tapped.
                  },
                  child: Text('Go back!'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Navigator.pop(context);
                    // Navigate back to first screen when tapped.
                  },
                  child: Text('Go back!'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
