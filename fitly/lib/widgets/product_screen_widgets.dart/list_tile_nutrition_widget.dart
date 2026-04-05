import 'package:flutter/material.dart';

class ListTileNutritionWidget extends StatelessWidget {
  const ListTileNutritionWidget({
    super.key,
    required this.title,
    required this.trailing,
  });
  final String title;
  final String trailing;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Text(title, style: Theme.of(context).textTheme.titleSmall),
          trailing: Text(
            "$trailing g",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        Divider(),
      ],
    );
  }
}
