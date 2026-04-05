import 'package:fitly/core/const_color/const_color.dart';
import 'package:fitly/screens/process_screen/gender_screen/bloc/gender_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonProcessWidget extends StatelessWidget {
  const ButtonProcessWidget({
    super.key,
    required this.gender,
    required this.icon,
  });
  final String gender;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        fixedSize: Size.fromHeight(MediaQuery.of(context).size.height / 9),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        elevation: 3,
        backgroundColor: ConstColor.cardChoice,
      ),
      onPressed: () {
        context.read<GenderBloc>().add(ChoiceGenderEvent(gender: gender));
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Text(gender, style: Theme.of(context).textTheme.titleLarge),
            icon,
          ],
        ),
      ),
    );
  }
}
