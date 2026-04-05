import 'package:fitly/core/const_color/const_color.dart';
import 'package:fitly/routes/route_key.dart';
import 'package:fitly/screens/process_screen/plan_screen/bloc/plan_bloc.dart';
import 'package:fitly/widgets/plan_screen_widgets/button_plan_widget.dart';
import 'package:fitly/widgets/customer_service_widgets/customer_service_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PlanScreen extends StatelessWidget {
  const PlanScreen({super.key});

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocListener<PlanBloc, PlanState>(
          listener: (context, state) {
            if (state is PlanTypeState) {
              if (state.planType == "Balanced") {
                context.push(
                  RouteKey.customizeMealScreen,
                  extra: state.planType,
                );
              }
            }
          },
          child: SingleChildScrollView(
            child: Column(
              spacing: 10,
              crossAxisAlignment: .start,
              children: [
                Text(
                  "What kind of meals do you\n Prefer?",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  "You'll have access to the full menu but select one to\n personalizes your experience",
                ),
                ButtonPlanWidget(
                  title: "Balanced",
                  subtitle: "Provides the nutrients your body needs to thrive",
                  icon: Icon(Icons.balance_rounded, size: 60),
                  carbsPercentage: "40-55%",
                  fatPercentage: "20-30%",
                  proteinPercentage: "20-35%",
                  flexProtein: 2,
                  flexCarbs: 3,
                  flexFat: 1,
                ),

                Center(
                  child: CircularPercentIndicator(
                    radius: 80,
                    lineWidth: 10,
                    animation: true,
                    animationDuration: 1200,
                    percent: 0.75,
                    circularStrokeCap: .round,
                    backgroundColor: ConstColor.progressIndicator2.withValues(
                      alpha: 0.4,
                    ),
                    center: Text(
                      "75%",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    animateToInitialPercent: true,
                    linearGradient: LinearGradient(
                      colors: [
                        ConstColor.progressIndicator,
                        ConstColor.progressIndicator2,
                        ConstColor.progressIndicator3,
                      ],
                    ),
                  ),
                ),

                ButtonPlanWidget(
                  title: "Low-Carb",
                  subtitle:
                      "Low in carbs, but high in healthy fats, and non-starchy veggies",
                  icon: Icon(Icons.no_food_outlined, size: 60),
                  carbsPercentage: "10-20%",
                  fatPercentage: "40-50%",
                  proteinPercentage: "20-35%",
                  flexProtein: 2,
                  flexCarbs: 1,
                  flexFat: 3,
                ),
                ButtonPlanWidget(
                  title: "High-Protein",
                  subtitle:
                      "Boosts muscle strength and vitality with lean protein",
                  icon: Icon(Icons.fitness_center, size: 60),
                  carbsPercentage: "35-40%",
                  fatPercentage: "10-25%",
                  proteinPercentage: "40-50%",
                  flexProtein: 3,
                  flexCarbs: 2,
                  flexFat: 1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
