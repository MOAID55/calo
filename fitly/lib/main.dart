import 'package:firebase_core/firebase_core.dart';
import 'package:fitly/core/services/setup.dart';
import 'package:fitly/core/theme/theme_app.dart';
import 'package:fitly/routes/route_app.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setup();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      child: MaterialApp.router(
        routerConfig: RouteApp.routers,
        theme: ThemeApp.lightMode,
        themeMode: .light,
      ),
    );
  }
}
