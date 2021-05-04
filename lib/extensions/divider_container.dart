import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/extensions/context_extension.dart';

class DividerContainer extends StatelessWidget {
  final Color color;
  final double height;
  final double width;

  DividerContainer(
      {@required this.color, @required this.height, @required this.width});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: context.dynamicHeight(height),
          width: context.dynamicWidth(width),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        SizedBox(width: 5)
      ],
    );
  }
}
