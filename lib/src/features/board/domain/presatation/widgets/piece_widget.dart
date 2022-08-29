import 'package:flutter/material.dart';


class PieceWidget extends StatelessWidget {
  final Color color;
  const PieceWidget({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.all(1),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: color,
              ),
            ),
          );
  }
}