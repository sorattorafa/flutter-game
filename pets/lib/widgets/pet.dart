import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Pet extends StatelessWidget {
  const Pet({
    required this.imageUrl,
    required this.color,
    required this.size,
    Key? key,
  }) : super(key: key);

  final String imageUrl;
  final Color color;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
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
    );
  }
}
