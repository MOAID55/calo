import 'package:fitly/widgets/customer_service_widgets/customer_service2_widget.dart';
import 'package:flutter/material.dart';

class CustomerServiceWidget {
  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context2) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context2).viewInsets.bottom, // is show the system what take from below and appear above
        ),
        child: CustomerService2Widget(),
      ),
    );
  }
}
 