import 'package:fitly/core/const_color/const_color.dart';
import 'package:fitly/screens/process_screen/allergies_screen/bloc/allergies_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonAllergiesWidget extends StatelessWidget {
  const ButtonAllergiesWidget({
    super.key,
    required this.title,
    required this.icon,
  });
  final String title;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        fixedSize: Size.fromHeight(MediaQuery.of(context).size.height / 10),
        backgroundColor: ConstColor.cardChoice,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      onPressed: () {
        context.read<AllergiesBloc>().add(ButtonChoiceEvent(choice: title));
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleLarge),
            icon,
          ],
        ),
      ),
    );
  }
}
