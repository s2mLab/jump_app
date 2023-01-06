import 'package:flutter/material.dart';

import '/providers/parameters.dart';
import 'double_heads_arrow.dart';
import 'text_with_index.dart';

class FlightApex extends StatelessWidget {
  const FlightApex({
    super.key,
    required this.apex,
    required this.floor,
    required this.arrowsHeadSize,
  });

  final Offset apex;
  final double floor;
  final double arrowsHeadSize;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final data = Parameters.of(context, listen: true);
    const color = Color.fromARGB(255, 31, 120, 165);

    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Positioned(
          left: apex.dx - deviceSize.width * 0.03,
          bottom: -(apex.dy - floor) / 2,
          child: Container(
            decoration: BoxDecoration(color: color.withAlpha(30)),
            padding: const EdgeInsets.all(2),
            child: Row(
              children: [
                TextWithIndex('H', 'max',
                    textStyle: TextStyle(
                      color: color,
                      fontWeight: FontWeight.bold,
                      fontSize: arrowsHeadSize,
                    )),
                Text(
                  ' = ${data.apex.toStringAsFixed(2)} m',
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.bold,
                    fontSize: arrowsHeadSize,
                  ),
                ),
              ],
            ),
          ),
        ),
        DoubleHeadsArrow(
          start: Offset(apex.dx, -floor),
          end: apex,
          headSize: arrowsHeadSize,
          color: color,
        ),
      ],
    );
  }
}
