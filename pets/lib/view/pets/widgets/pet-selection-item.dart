import 'package:flutter/material.dart';
import 'package:pets/providers/pets.dart';
import 'package:pets/widgets/radio_button_item.dart';
import 'package:provider/provider.dart';

class PetSelectionItem extends StatefulWidget {
  const PetSelectionItem({
    required this.imageUrl,
    required this.color,
    Key? key,
  }) : super(key: key);

  final String imageUrl;
  final Color color;
  @override
  _PetPetSelectionItemState createState() => _PetPetSelectionItemState();
}

class _PetPetSelectionItemState extends State<PetSelectionItem> {
  @override
  Widget build(BuildContext context) {
    final petProvider = Provider.of<PetsProvider>(context, listen: false);

    return Container(
      width: 120,
      height: 120,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: 10.0,
          // maxWidth: 150.0,
        ),
        child: RadioButtonItem(
          enabled: true,
          selected:
              context.watch<PetsProvider>().selectedPet == widget.imageUrl,
          onPressed: () {
            setState(() {
              petProvider.setSelectedPet(widget.imageUrl);
            });
          },
          child: Image.asset(
            widget.imageUrl,
            fit: BoxFit.contain,
            color: Colors.purple.shade300,
          ),
        ),
      ),
    );
  }
}
