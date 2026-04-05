import 'package:flutter/material.dart';

class ContainerAccountWidget extends StatelessWidget {
  const ContainerAccountWidget({super.key, required this.icon, required this.title});
  final Icon icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: kElevationToShadow[0.9],
        border: Border.all(color: Colors.grey.shade300, width: 2),
      ),
      width: MediaQuery.of(context).size.width,
      height: 60,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: .center,
          mainAxisAlignment: .spaceBetween,

          children: [
            Row(
              children: [
                icon,
                Text(title),
              ],
            ),
            Icon(Icons.arrow_forward_ios_rounded),
          ],
        ),
      ),
    );
  }
}
