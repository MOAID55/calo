import 'package:fitly/core/validator/app_validator.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class InputFieldLoginWidget extends StatelessWidget {
  const InputFieldLoginWidget({
    super.key,
    required this.title,
    this.hint,
    this.controller,
  });

  final String title;
  final String? hint;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(title, style: Theme.of(context).textTheme.labelLarge),
        Gap(8),
        TextFormField(
          controller: controller,
          keyboardType: .emailAddress,
          obscureText: "Password" == title ? true : false,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: hint ?? "Enter text here",
            hintStyle: TextStyle(fontSize: 14),
            suffixIcon: "Password" == title ? Icon(Icons.visibility_off) : null,
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
          ),
          validator: (value) {
            return AppValidator.checkValidate(title, value);
          },

          onTapOutside: (value) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
        ),
      ],
    );
  }
}
