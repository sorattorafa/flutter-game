import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Pet extends StatefulWidget {
  const Pet({
    required this.imageUrl,
    required this.color,
    required this.size,
    required this.name,
    Key? key,
  }) : super(key: key);

  final String imageUrl;
  final String name;
  final Color color;
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
        Text(widget.name, style: TextStyle(color: Colors.black, fontSize: 16)),
        Container(
          width: widget.size,
          height: widget.size,
          color: Colors.blue.shade50,
          child: widget.imageUrl.contains('svg')
              ? SvgPicture.asset(
                  widget.imageUrl,
                  fit: BoxFit.contain,
                  color: widget.color,
                )
              : Image.asset(
                  widget.imageUrl,
                  fit: BoxFit.contain,
                  color: widget.color,
                ),
        ),
      ]),
      Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Text('Life', style: TextStyle(color: Colors.black, fontSize: 12)),
        SliderTheme(
          data: returnSliverThemeData(Colors.red[700]!, Colors.red[100]!),
          child: Slider(
            min: 0,
            max: 100,
            value: 50,
            onChanged: (onchanged) {},
          ),
        ),
        Text('Happy', style: TextStyle(color: Colors.black, fontSize: 12)),
        SliderTheme(
          data: returnSliverThemeData(Colors.green[700]!, Colors.green[100]!),
          child: Slider(
            min: 0,
            max: 100,
            value: 50,
            onChanged: (onchanged) {},
          ),
        ),
        Text('Hungry', style: TextStyle(color: Colors.black, fontSize: 12)),
        SliderTheme(
          data: returnSliverThemeData(Colors.purple[700]!, Colors.purple[100]!),
          child: Slider(
            min: 0,
            max: 100,
            value: 50,
            onChanged: (onchanged) {},
          ),
        ),
      ]),
    ]);
  }
}
