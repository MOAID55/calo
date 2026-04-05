import 'package:fitly/core/const_color/const_color.dart';
import 'package:fitly/routes/route_key.dart';
import 'package:fitly/screens/process_screen/goal_screen/bloc/goal_bloc.dart';
import 'package:fitly/widgets/goal_screen_widgets/buttontwotext_process_widget.dart';
import 'package:fitly/widgets/customer_service_widgets/customer_service_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class GoalScreen extends StatelessWidget {
  const GoalScreen({super.key, required this.gender});
  final String gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              child: IconButton(
                icon: Icon(Icons.headset_mic_outlined),
                onPressed: () {
                  CustomerServiceWidget.show(context);
                },
              ),
            ),
          ),
        ],
      ),
      body: BlocListener<GoalBloc, GoalState>(
        listener: (context, state) {
          if (state is GoalPlanState) {
            if(state.goalPlan == "Eat healthy") {
              context.push(RouteKey.allergiesScreen,extra: state.goalPlan);
            }
          }

        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              spacing: 30,
              crossAxisAlignment: .start,
              children: [
                Text(
                  "What's your goal?",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Gap(20),
                ButtonTwoTextProcessWidget(
                  title: "Eat healthy",
                  subtitle: "Here to make it easier to eat healthier",
                  icon: Icon(Icons.health_and_safety,size: 45,),
                ),
                ButtonTwoTextProcessWidget(
                  title: "Lose Weight",
                  subtitle: "Safe and healthy rate of weight & fat loss",
                  icon: Icon(Icons.run_circle_outlined,size: 45,),
                ),
                Gap(20),
                Center(
                  child: CircularPercentIndicator(
                    radius: 80,
                    lineWidth: 10,
                    animation: true,
                    animationDuration: 1200,
                    percent: 0.25,
                    circularStrokeCap: .round,
                    backgroundColor: ConstColor.progressIndicator2.withValues(
                      alpha: 0.4,
                    ),
                    center: Text("25%",style: Theme.of(context).textTheme.displaySmall),
                    animateToInitialPercent: true, //start from 0 to exact percent
                    linearGradient: LinearGradient(
                      colors: [
                        ConstColor.progressIndicator,
                        ConstColor.progressIndicator2,
                        ConstColor.progressIndicator3,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
