import 'package:flutter/material.dart';

class ContainerCategoryWidget extends StatelessWidget {
  const ContainerCategoryWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: kElevationToShadow[2],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(child: Text(title)),
    );
  }
}
