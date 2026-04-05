import 'package:fitly/core/const_color/const_color.dart';
import 'package:fitly/routes/route_key.dart';
import 'package:fitly/screens/process_screen/gender_screen/bloc/gender_bloc.dart';
import 'package:fitly/widgets/gender_screen_widgets/button_process_widget.dart';
import 'package:fitly/widgets/customer_service_widgets/customer_service_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class GenderScreen extends StatelessWidget {
  const GenderScreen({super.key});

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
      body: BlocListener<GenderBloc, GenderState>(
        listener: (context, state) {
          if (state is ChoiceGenderState) {
            context.push(RouteKey.goalScreen, extra: state.gender);
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 12,
            crossAxisAlignment: .start,
            children: [
              Text(
                "What's your gender?",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                "We will use this to calculate your daily calorie needs",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 12),
              ButtonProcessWidget(
                gender: "male",
                icon: Icon(Icons.male, size: 45),
              ),
              ButtonProcessWidget(
                gender: "Female",
                icon: Icon(Icons.female, size: 45),
              ),
              Gap(20),
              Center(
                child: CircularPercentIndicator(
                  radius: 80,
                  lineWidth: 10,
                  animation: true,
                  animationDuration: 300,
                  percent: 0,
                  circularStrokeCap: .round,
                  backgroundColor: ConstColor.progressIndicator2.withValues(
                    alpha: 0.4,
                  ),
                  center: Text(
                    "0%",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  animateToInitialPercent: true,
                  linearGradient: LinearGradient(
                    colors: [
                      ConstColor.progressIndicator,
                      ConstColor.progressIndicator,
                      ConstColor.progressIndicator,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
