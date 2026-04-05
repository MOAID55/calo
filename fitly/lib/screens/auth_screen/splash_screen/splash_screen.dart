import 'package:fitly/routes/route_key.dart';
import 'package:fitly/screens/auth_screen/splash_screen/bloc/splash_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      body: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is AlreadySignInState) {
            context.go(RouteKey.marketScreen);
          }
          if (state is LoginPageState) {
            context.go(RouteKey.loginScreen);
          }
        },
        child: Center(
          child: Stack(
            alignment: .center,
            children: [
              BlocBuilder<SplashBloc, SplashState>(
                builder: (context, state) {
                  if (state is AppearLogoState) {
                    return Image.asset(
                      "assets/images/logoname.png",
                      width: 200,
                      height: 200,
                    );
                  }
                  if (state is SplashInitial) {
                    return Lottie.asset(
                      "assets/animation/logo.json",
                      repeat: false,
                      height: 200,
                      width: 200,
                    );
                  }
                  return SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
