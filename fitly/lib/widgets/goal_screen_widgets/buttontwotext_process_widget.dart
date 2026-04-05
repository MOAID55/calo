import 'package:fitly/core/const_color/const_color.dart';
import 'package:fitly/screens/process_screen/goal_screen/bloc/goal_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonTwoTextProcessWidget extends StatelessWidget {
  const ButtonTwoTextProcessWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });
  final String title;
  final String subtitle;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        fixedSize: Size.fromHeight(MediaQuery.of(context).size.height / 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        backgroundColor: ConstColor.cardChoice
      ),
      onPressed: () {
        context.read<GoalBloc>().add(GoalPlanEvent(goalPlan: title));
      },
      child: ListTile(
        title: Text(title,style: Theme.of(context).textTheme.titleLarge,),
        subtitle: Text(subtitle),
        trailing: icon,
      ),
    );
  }
}
