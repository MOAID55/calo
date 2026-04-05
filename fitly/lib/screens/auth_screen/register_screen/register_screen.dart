import 'package:fitly/screens/auth_screen/register_screen/bloc/register_bloc.dart';
import 'package:fitly/widgets/auth_screen_widgets/input_field_login_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';

class RegisterScreen extends HookWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final nameController = useTextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          context.loaderOverlay.hide();
          if (state is CreateAccountSussecceflyState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Center(child: Text("Account Created Successfully!")),
                backgroundColor: Color(0xFF4CAF50),
              ),
            );
            context.pop();
          }
          if (state is CreateAccountErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Center(child: Text("Try Again!")),
                backgroundColor: Color(0xFF4CAF50),
              ),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              spacing: 10,
              crossAxisAlignment: .center,
              mainAxisAlignment: .center,
              children: [
                BlocBuilder<RegisterBloc, RegisterState>(
                  builder: (context, state) {
                    if (state is CreateAccountErrorState) {
                      return Text(
                        state.errorMessage,
                        style: TextStyle(color: Colors.red),
                      );
                    }
                    return SizedBox.shrink();
                  },
                ),

                Text(
                  "Your journey starts here",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text("Create New Account"),

                Form(
                  key: formKey,
                  child: Column(
                    spacing: 20,
                    children: [
                      InputFieldLoginWidget(
                        title: "Name",
                        controller: nameController,
                        hint: "Enter your Name",
                      ),
                      InputFieldLoginWidget(
                        title: "Email",
                        controller: emailController,
                        hint: "Enter your email",
                      ),
                      InputFieldLoginWidget(
                        title: "Password",
                        controller: passwordController,
                        hint: "Enter your password",
                      ),

                      FilledButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.loaderOverlay.show();
                            context.read<RegisterBloc>().add(
                              CreateAccountEvent(
                                email: emailController.text,
                                password: passwordController.text,
                                name: nameController.text,
                              ),
                            );
                          }
                        },
                        style: FilledButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          fixedSize: Size(
                            MediaQuery.of(context).size.width / 3,
                            MediaQuery.of(context).size.width / 8,
                          ),
                        ),
                        child: Text("Register"),
                      ),
                    ],
                  ),
                ),
                Text("Your journey to a healthier you starts here."),
                Image.asset(
                  "assets/images/logoname.png",
                  errorBuilder: (context, error, stackTrace) =>
                      SizedBox.shrink(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
