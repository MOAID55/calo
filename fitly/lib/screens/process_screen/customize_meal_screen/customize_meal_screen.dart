import 'package:fitly/routes/route_key.dart';
import 'package:fitly/screens/process_screen/customize_meal_screen/bloc/customize_meal_bloc.dart';
import 'package:fitly/widgets/customer_service_widgets/customer_service_widget.dart';
import 'package:fitly/widgets/customize_meal_screen/row_customize_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomizeMealScreen extends StatelessWidget {
  const CustomizeMealScreen({super.key, required this.type});
  final String type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 8,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: .bottomEnd,
            end: .bottomStart,
            colors: [Colors.green, Colors.white],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<CustomizeMealBloc, CustomizeMealState>(
            builder: (context, state) {
              if (state is TotalCaloriesPriceState) {
                return Row(
                  crossAxisAlignment: .center,
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: .bold,
                        ),
                        children: [
                          TextSpan(text: "${state.perDayPrice}/day\n"),
                          TextSpan(text: "VAT inclusive"),
                        ],
                      ),
                    ),
                    FilledButton(
                      style: FilledButton.styleFrom(fixedSize: Size(200, 70)),
                      onPressed: () {
                        context.push(RouteKey.displayMealScreen);
                      },
                      child: Text("Continue"),
                    ),
                  ],
                );
              }
              return SizedBox.shrink();
            },
          ),
        ),
      ),
      appBar: AppBar(
        title: Text("Customize Your Meal"),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 15,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              Image.asset(
                "assets/images/meal_fitly.png",
                width: MediaQuery.of(context).size.width * 0.25,
                height: MediaQuery.of(context).size.width * 0.25,
              ),

              BlocBuilder<CustomizeMealBloc, CustomizeMealState>(
                builder: (context, state) {
                  return Text(
                    "avg. ${state is TotalCaloriesPriceState ? state.totalCalories : SizedBox.shrink()} Kcal/day",
                    style: TextStyle(fontSize: 20, fontWeight: .bold),
                  );
                },
              ),

              SizedBox(height: 10),
              Text(
                "Choose your daily meals",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              RowCustomizeWidget(title: "BreakFast", type: type),
              Divider(),
              RowCustomizeWidget(title: "Lunch", type: type),
              Divider(),
              RowCustomizeWidget(title: "Dinner", type: type),
              Divider(),
              RowCustomizeWidget(title: "Snacks", type: type),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
