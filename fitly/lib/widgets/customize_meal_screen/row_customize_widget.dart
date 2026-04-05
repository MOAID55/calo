import 'package:fitly/screens/process_screen/customize_meal_screen/bloc/customize_meal_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:input_quantity/input_quantity.dart';

class RowCustomizeWidget extends StatelessWidget {
  const RowCustomizeWidget({
    super.key,
    required this.title,
    required this.type,
  });
  final String title;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Text(title,style: TextStyle(fontWeight: .bold),),
        InputQty.int(
          decoration: QtyDecorationProps(
            borderShape: BorderShapeBtn.circle,
            btnColor: Colors.green,
            fillColor: Colors.white,
            isBordered: false,
          ),
          qtyFormProps: QtyFormProps(enableTyping: false),
          maxVal: 100,
          initVal: 1,
          minVal: 0,
          steps: 1,
          onQtyChanged: (val) {
            if (type == "Balanced") {
              context.read<CustomizeMealBloc>().add(
                ChangeMealQty(meal: title, quantity: val),
              );
            }
          },
        ),
      ],
    );
  }
}
