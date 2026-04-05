import 'package:fitly/routes/route_key.dart';
import 'package:fitly/screens/meal_screen/bloc/meal_bloc.dart';
import 'package:fitly/widgets/meal_screen_widgets/row_meal_description_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Meal")),
      body: BlocListener<MealBloc, MealState>(
        listener: (context, state) {
          if (state is ButtonState) {
            context.push(RouteKey.genderScreen);
          }
        },

        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: .center,
              spacing: 15,
              children: [
                SizedBox(height: 30),
                Image.asset(
                  "assets/images/meal_fitly.png",
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: MediaQuery.of(context).size.width * 0.25,
                ),
                Text("Get a personalized Plan", style: Theme.of(context).textTheme.titleLarge),
                Text(
                  "Our nutritionist will help design a meal plan \n just for you!",
                  textAlign: TextAlign.center,
                ),
                Divider(color: Colors.black, thickness: 1),
                RowMealDescriptionWidget(
                  imagePath: "assets/images/meal.png",
                  title: "Meals made easy",
                  subtitle: "Delicious meals without the cooking stress",
                ),
                RowMealDescriptionWidget(
                  imagePath: "assets/images/male.png",
                  title: "Made just for you",
                  subtitle: "Chef-crafted meals made to your taste & goals",
                ),
                RowMealDescriptionWidget(
                  imagePath: "assets/images/chicken.png",
                  title: "A world pf flavors",
                  subtitle: "Enjoy a wide range of meals every day",
                ),
                
                FilledButton(
                  style: FilledButton.styleFrom(
                    minimumSize: Size(
                      MediaQuery.of(context).size.width,
                      MediaQuery.of(context).size.height * 0.05,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: const Color.fromARGB(255, 46, 115, 48),
                  ),
                  onPressed: () {
                    context.read<MealBloc>().add(ButtonEvent());
                  },
                  child: Text("Subscribe to meals"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
