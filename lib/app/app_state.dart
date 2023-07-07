import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba/config/providers/auth_provider.dart';
import 'package:prueba/config/providers/bottom_nav_bar_provider.dart';
import 'package:prueba/config/providers/user_provider.dart';
import 'app.dart';

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => BottomNavBarProvider()),
      ],
      child: const App(),
    );
  }
}