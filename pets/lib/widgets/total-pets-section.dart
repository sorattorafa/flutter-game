import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pets/widgets/pets-counter.dart';

class TotalPetsSection extends StatelessWidget {
  const TotalPetsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      child: Row(
        children: [
          PetsCount(),
          Container(
            padding: const EdgeInsets.all(12),
            child: ElevatedButton(
                onPressed: () async {
                  Navigator.pushNamed(context, '/newpet');
                },
                child: Text('Novo pet')),
          ),
        ],
      ),
    );
  }
}
