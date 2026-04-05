import 'package:flutter/material.dart';

class RowMealDescriptionWidget extends StatelessWidget {
  const RowMealDescriptionWidget({
    super.key,
    required this.imagePath,
    required this.subtitle,
    required this.title,
  });

  final String imagePath;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle, style: TextStyle(fontSize: 12)),
      leading: CircleAvatar(
        minRadius: 28,
        maxRadius: 28,
        backgroundImage: AssetImage(imagePath),
      ),
    );
  }
}
