import 'package:flutter/material.dart';

class ListTileWidgets extends StatelessWidget {
  const ListTileWidgets({super.key, required this.leading, required this.title, required this.trailing});
  final Icon leading;
  final String title;
  final Icon trailing;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title: Text(title),
      trailing: trailing,
    );
  }
}