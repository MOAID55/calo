import 'package:fitly/screens/process_screen/display_meal_screen/bloc/display_meal_bloc.dart';
import 'package:fitly/widgets/customer_service_widgets/customer_service_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class DisplayMealScreen extends StatelessWidget {
  const DisplayMealScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Here's what's cooking "),
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
        child: BlocBuilder<DisplayMealBloc, DisplayMealState>(
          builder: (context, state) {
            if (state is MealLoadedState) {
              // Using "expand" to flatten the list of lists into a single list of products
              // for each category, take its products
              final allProduct = state.category
                  .expand((e) => e.products)
                  .toList();

              return MasonryGridView.builder(
                itemCount: allProduct.length,
                gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),

                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(borderRadius: .circular(16)),
                    elevation: 2,
                    child: Column(
                      crossAxisAlignment: .stretch,
                      children: [
                        ClipRRect(
                          borderRadius: .circular(16),
                          child: Image.network(
                            allProduct[index].image,
                            height: 120 + (index % 4) * 40,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            allProduct[index].name,
                            style: TextStyle(fontSize: 18, fontWeight: .bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${allProduct[index].nutrition.caloriesPerServing.toString()} kcal",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: .bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
