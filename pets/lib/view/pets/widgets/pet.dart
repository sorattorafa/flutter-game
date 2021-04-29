import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Pet extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Column(children: [
      Text(name, style: TextStyle(color: Colors.black, fontSize: 16)),
      Container(
        width: size,
        height: size,
        color: Colors.blue.shade50,
        child: imageUrl.contains('svg')
            ? SvgPicture.asset(
                imageUrl,
                fit: BoxFit.contain,
                color: color,
              )
            : Image.asset(
                imageUrl,
                fit: BoxFit.contain,
                color: color,
              ),
      ),
    ]);
  }
}
