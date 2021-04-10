import 'package:flutter/material.dart';

class Pet extends StatelessWidget {
  const Pet({
    @required this.state,
    @required this.color,
    @required this.size,
    Key key,
  }) : super(key: key);

  final IconData state;
  final MaterialColor color;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 250,
      child: Icon(state, size: size, color: color),
    );
  }
}
