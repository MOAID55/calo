import 'package:fitly/core/const_color/const_color.dart';
import 'package:fitly/routes/route_key.dart';
import 'package:fitly/screens/process_screen/allergies_screen/bloc/allergies_bloc.dart';
import 'package:fitly/widgets/allergies_screen_widget/button_allergies_widget.dart';
import 'package:fitly/widgets/customer_service_widgets/customer_service_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class AllergiesScreen extends StatelessWidget {
  const AllergiesScreen({super.key});

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
      body: BlocListener<AllergiesBloc, AllergiesState>(
        listener: (context, state) {
          if (state is ButtonChoiceState) {
            if(state.choice == "No") {
              context.push(RouteKey.planScreen, extra: state.choice);
            }
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: .start,
            spacing: 25,
            children: [
              Text(
                "Do you have any Food\nallergies?",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Gap(20),
              ButtonAllergiesWidget(
                title: "Yes",
                icon: Icon(Icons.check, size: 45),
              ),
              ButtonAllergiesWidget(
                title: "No",
                icon: Icon(Icons.cancel, size: 45),
              ),
              Gap(20),
              Center(
                child: CircularPercentIndicator(
                  radius: 80,
                  lineWidth: 10,
                  animation: true,
                  animationDuration: 1200,
                  animateFromLastPercent: true,

                  linearGradient: LinearGradient(
                    colors: [
                      ConstColor.progressIndicator,
                      ConstColor.progressIndicator2,
                      ConstColor.progressIndicator3,
                    ],
                  ),
                  percent: 0.50,
                  circularStrokeCap: .round,
                  backgroundColor: ConstColor.progressIndicator2.withValues(
                    alpha: 0.4,
                  ),
                  center: Text(
                    "50%",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  animateToInitialPercent: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
