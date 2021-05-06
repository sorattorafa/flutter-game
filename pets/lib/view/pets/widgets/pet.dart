import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pets/models/pet.dart';

class Pet extends StatefulWidget {
  const Pet({
    required this.pet,
    required this.size,
    Key? key,
  }) : super(key: key);

  final PetModel pet;
  final double size;

  @override
  _PetState createState() => _PetState();
}

class _PetState extends State<Pet> {
  SliderThemeData returnSliverThemeData(
          Color activeColor, Color inactiveColor) =>
      SliderTheme.of(context).copyWith(
          activeTrackColor: activeColor,
          inactiveTrackColor: inactiveColor,
          trackShape: RectangularSliderTrackShape(),
          trackHeight: 5.0,
          thumbColor: Colors.redAccent,
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0.0),
          overlayColor: Colors.red.withAlpha(32),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 12.0));

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Column(children: [
        Text(widget.pet.name,
            style: TextStyle(color: Colors.black, fontSize: 16)),
        Container(
          width: widget.size,
          height: widget.size,
          color: Colors.blue.shade50,
          child: widget.pet.imageUrl.contains('svg')
              ? SvgPicture.asset(
                  widget.pet.imageUrl,
                  fit: BoxFit.contain,
                  color: widget.pet.color,
                )
              : Image.asset(
                  widget.pet.imageUrl,
                  fit: BoxFit.contain,
                  color: widget.pet.color,
                ),
        ),
      ]),
      Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Text('Life', style: TextStyle(color: Colors.black, fontSize: 12)),
        SliderTheme(
          data: returnSliverThemeData(Colors.red[700]!, Colors.red[100]!),
          child: Slider(
            min: 0,
            max: 101,
            value: widget.pet.life.toDouble(),
            onChanged: (onchanged) {},
          ),
        ),
        Text('Happy', style: TextStyle(color: Colors.black, fontSize: 12)),
        SliderTheme(
          data: returnSliverThemeData(Colors.green[700]!, Colors.green[100]!),
          child: Slider(
            min: 0,
            max: 100,
            value: widget.pet.happy.toDouble(),
            onChanged: (onchanged) {},
          ),
        ),
        Text('Hungry', style: TextStyle(color: Colors.black, fontSize: 12)),
        SliderTheme(
          data: returnSliverThemeData(Colors.purple[700]!, Colors.purple[100]!),
          child: Slider(
            min: 0,
            max: 100,
            value: widget.pet.hungry.toDouble(),
            onChanged: (onchanged) {},
          ),
        ),
        Text('Sleep', style: TextStyle(color: Colors.black, fontSize: 12)),
        SliderTheme(
          data: returnSliverThemeData(Colors.blue[800]!, Colors.purple[100]!),
          child: Slider(
            min: 0,
            max: 100,
            value: widget.pet.sleep.toDouble(),
            onChanged: (onchanged) {},
          ),
        ),
      ]),
    ]);
  }
}
