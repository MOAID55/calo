import 'package:fitly/models/category_model/product_model.dart';
import 'package:fitly/widgets/product_screen_widgets.dart/list_tile_nutrition_widget.dart';
import 'package:fitly/widgets/product_screen_widgets.dart/row_nutrition_widget.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      appBar: AppBar(
        title: Text("Product Detail") ,centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Column(
          spacing: 20,
          crossAxisAlignment: .stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.shade300
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                  
                ),
              ),
              clipBehavior: .hardEdge,
              height: MediaQuery.of(context).size.height / 3,
              child: Image.network(product.image, fit: BoxFit.fill),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                spacing: 10,
                crossAxisAlignment: .start,
                children: [
                  Text(product.plan,style: TextStyle(fontSize: 20),),
                  Text(
                    product.name,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Container(decoration: BoxDecoration(
                    borderRadius: .circular(8),
                    color: Colors.grey.shade300
                  ), child: Text(product.category,style: TextStyle(fontWeight: FontWeight.bold),)),
                  Text("${product.price} ${product.currency}",style: Theme.of(context).textTheme.displaySmall),
                  Divider(thickness: 3),
                  Text("Overall Macros",style: TextStyle(fontWeight: .bold)),
                  Row(
                    crossAxisAlignment: .center,
                    mainAxisAlignment: .spaceAround,
                    children: [
                      CircularPercentIndicator(
                        radius: 45.0,
                        animation: true,
                        animationDuration: 1200,
                        lineWidth: 9.0,
                        percent: product.nutrition.macros.carbs / 100,
                        center: Text(
                          "${product.nutrition.caloriesPerServing} Calories",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12.5,
                          ),
                        ),
                        circularStrokeCap: CircularStrokeCap.butt,
                        backgroundColor: Colors.yellow,
                        progressColor: Colors.red,
                      ),
                      RowNutritionWidget(
                        title: "Pro",
                        color: Colors.green,
                        nutrition: product.nutrition.macros.protein,
                      ),
                      RowNutritionWidget(
                        title: "Carb",
                        color: Colors.yellow,
                        nutrition: product.nutrition.macros.carbs,
                      ),
                      RowNutritionWidget(
                        title: "Fat",
                        color: Colors.red,
                        nutrition: product.nutrition.macros.fat,
                      ),
                    ],
                  ),
                  Column(
                    children: product.nutrition.macros.asMap.entries.map((e) {
                      return ListTileNutritionWidget(
                        title: e.key,
                        trailing: e.value.toString(),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
