import 'dart:math';
import 'package:flutter/material.dart';

Path arrowHeadPath(Offset p1, Offset p2, double headSize) {
  final dX = p2.dx - p1.dx;
  final dY = p2.dy - p1.dy;
  final angle = atan2(dY, dX);
  const arrowAngle = 20 * pi / 180;
  final path = Path();
  path.moveTo(p2.dx - headSize * cos(angle - arrowAngle),
      p2.dy - headSize * sin(angle - arrowAngle));
  path.lineTo(p2.dx, p2.dy);
  path.lineTo(p2.dx - headSize * cos(angle + arrowAngle),
      p2.dy - headSize * sin(angle + arrowAngle));
  path.close();
  return path;
}

void showHelp(BuildContext context,
    {String? title, String? content, String? imageName}) async {
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: title != null ? Text(title) : null,
        content: content != null ? Text(content) : null,
        //imageName: imageName != null ? Text(imageName) : null,
      );
    },
  );
}

void showModel(BuildContext context,
    {String? title, String? content, String? imageName}) async {
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: title != null ? Text(title) : null,
        content: Column(
          mainAxisSize:
              MainAxisSize.min, // Use this to constrain the dialog size
          children: <Widget>[
            /*if (content != null) Text(content),
            if (imageName != null)
              Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width *
                      0.95, // 70% of screen width
                  maxHeight: MediaQuery.of(context).size.height *
                      0.95, // 70% of screen height
                ),
                child: AspectRatio(
                  aspectRatio: 16 /
                      8, // change this value as per your image aspect ratio
                  child: Image.asset(
                      imageName, //'assets/images/modele_biomeca.png',
                      fit: BoxFit.cover),*/
            if (imageName != null)
              Image.asset(
                imageName,
                fit: BoxFit.cover,
              ),
          ],
        ),
      );
    },
  );
}
