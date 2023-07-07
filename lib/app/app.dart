import 'package:flutter/material.dart';
import 'package:prueba/config/routes/routes.dart';
import 'package:prueba/design/locales.dart';
import 'package:prueba/design/themes.dart';
import 'package:prueba/infrastructure/helpers/auth_state_changes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: BukDoubleThemes.defaultTheme,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const[
        GlobalMaterialLocalizations.delegate
      ],
      supportedLocales: Locales.list,
      home: const AuthStateChanges(),
      routes: AppRoutes.routes,
    );
  }
}