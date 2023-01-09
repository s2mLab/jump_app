import 'package:flutter/material.dart';

class BackgoundImage extends StatelessWidget {
  const BackgoundImage({
    Key? key,
    required this.floor,
    required this.imagePath,
  }) : super(key: key);

  final double floor;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: 0, right: 0, bottom: floor, child: Image.asset(imagePath));
  }
}
