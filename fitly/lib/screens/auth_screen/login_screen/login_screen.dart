import 'package:fitly/routes/route_key.dart';
import 'package:fitly/screens/auth_screen/login_screen/bloc/login_bloc.dart';
import 'package:fitly/widgets/auth_screen_widgets/input_field_login_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';

class LoginScreen extends HookWidget {
  const LoginScreen({super.key});
  
  
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          context.loaderOverlay.hide();
          state is RegisterButtonState
              ? context.push(RouteKey.registerScreen)
              : state is LoginButtonSuccessfullyState
              ? context.go(RouteKey.mealScreen)
              : SizedBox.shrink();
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              spacing: 15,
              crossAxisAlignment: .center,
              mainAxisAlignment: .center,
              children: [
                Text(
                  "Welcome to Calo App",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text("Please Login to your account"),

                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    if (state is LoginButtonErrorState) {
                      return Text(
                        state.errorMessage,
                        style: TextStyle(color: Colors.red),
                      );
                    }
                    return SizedBox.shrink();
                  },
                ),

                Form(
                  key: formKey,
                  child: Column(
                    spacing: 20,
                    children: [
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
                            context.read<LoginBloc>().add(
                              LoginButtonEvent(
                                email: emailController.text,
                                password: passwordController.text,
                              ),
                            );
                          }
                        },
                        style: FilledButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          fixedSize: Size(
                            MediaQuery.of(context).size.width / 4,
                            MediaQuery.of(context).size.width / 8,
                          ),
                        ),
                        child: Text("Login"),
                      ),
                      Row(
                        crossAxisAlignment: .center,
                        mainAxisAlignment: .center,
                        children: [
                          Text(
                            "Not registered?",
                            style: TextStyle(color: Colors.purple),
                          ),
                          TextButton(
                            onPressed: () {
                              context.read<LoginBloc>().add(
                                RegisterButtonEvent(),
                              );
                            },
                            child: Text("Create an account!"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                 
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
