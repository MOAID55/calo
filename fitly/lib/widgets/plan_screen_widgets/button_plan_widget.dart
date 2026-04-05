import 'package:fitly/screens/process_screen/plan_screen/bloc/plan_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonPlanWidget extends StatelessWidget {
  const ButtonPlanWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.fatPercentage,
    required this.proteinPercentage,
    required this.carbsPercentage,
    required this.flexFat,
    required this.flexProtein,
    required this.flexCarbs,
  });
  final String title;
  final String subtitle;
  final Icon icon;
  final String fatPercentage;
  final int flexFat;
  final String proteinPercentage;
  final int flexProtein;
  final String carbsPercentage;
  final int flexCarbs;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        title == "Balanced"
            ? context.read<PlanBloc>().add(BalancedEvent())
            : context.read<PlanBloc>().add(LowCarbsEvent());
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 4,

        decoration: BoxDecoration(
          color: Colors.greenAccent,
          border: Border.all(width: 2),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: .start,
          spacing: 10,
          children: [
            ListTile(
              title: Text(title, style: Theme.of(context).textTheme.titleLarge),
              subtitle: Text(
                subtitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: icon,
            ),
            SizedBox(
              height: 60,
              child: Row(
                spacing: 5,
                children: [
                  Expanded(
                    flex: flexProtein,
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(8),
                                topLeft: Radius.circular(8),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          proteinPercentage,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text("Protein", style: TextStyle(fontWeight: .bold)),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: flexCarbs,
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        Expanded(child: Container(color: Colors.yellow)),
                        Text(
                          carbsPercentage,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text("Carbs", style: TextStyle(fontWeight: .bold)),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: flexFat,
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(8),
                                topRight: Radius.circular(8),
                              ),
                            ),
                          ),
                        ),
                        Text(fatPercentage, maxLines: 1),
                        Text("Fat", style: TextStyle(fontWeight: .bold)),
                      ],
                    ),
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
