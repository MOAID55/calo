import 'package:flutter/material.dart';

class RowNutritionWidget extends StatelessWidget {
  const RowNutritionWidget({
    super.key,
    required this.title,
    required this.color,
    required this.nutrition,
  });
  final String title;
  final Color color;
  final double nutrition;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          spacing: 3,
          children: [
            CircleAvatar(maxRadius: 5, backgroundColor: color),
            Text(title, style: Theme.of(context).textTheme.titleSmall),
          ],
        ),
        Text(
          "${nutrition.toString()} g",
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ],
    );
  }
}
