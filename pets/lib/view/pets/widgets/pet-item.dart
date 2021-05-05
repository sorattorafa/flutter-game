import 'package:flutter/material.dart';
import 'package:pets/models/pet.dart';

class PetItem extends StatefulWidget {
  const PetItem({
    required this.pet,
    required this.size,
    required this.name,
    Key? key,
  }) : super(key: key);

  final PetModel pet;
  final double size;
  final String name;

  @override
  _PetState createState() => _PetState();
}

class _PetState extends State<PetItem> {
  Color primaryColor = Colors.red[700]!;
  Color secondColor = Colors.red[100]!;

  @override
  void initState() {
    super.initState();

    switch (widget.name) {
      case 'Happy':
        primaryColor = Colors.green[700]!;
        secondColor = Colors.green[100]!;
        break;
      case 'Clean':
        primaryColor = Colors.blue[700]!;
        secondColor = Colors.blue[100]!;
        break;
      case 'Eat':
        primaryColor = Colors.blueGrey[700]!;
        secondColor = Colors.blueGrey[100]!;
        break;
      case 'Sleep':
        primaryColor = Colors.deepPurple[700]!;
        secondColor = Colors.deepPurple[100]!;
        break;

      default:
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  SliderThemeData returnSliverThemeData(
          Color activeColor, Color inactiveColor) =>
      SliderTheme.of(context).copyWith(
          activeTrackColor: activeColor,
          inactiveTrackColor: inactiveColor,
          trackShape: RectangularSliderTrackShape(),
          trackHeight: 5.0,
          thumbColor: secondColor,
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0.0),
          overlayColor: Colors.red.withAlpha(32),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 12.0));

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top:14),
     // color: Colors.purple.shade200,
      width: widget.size,
      height: widget.size,
      child: Column(
        children: [
          Text(widget.name),
          SliderTheme(
            data: returnSliverThemeData(primaryColor, secondColor),
            child: Slider(
              min: 0,
              max: 100,
              value: widget.pet.life.toDouble(),
              onChanged: (onchanged) {},
            ),
          ),
        ],
      ),
    );
  }
}
