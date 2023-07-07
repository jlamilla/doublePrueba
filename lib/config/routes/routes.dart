import 'package:flutter/material.dart';
import 'package:prueba/infrastructure/helpers/auth_state_changes.dart';
import 'package:prueba/ui/constants/routes.dart';
import 'package:prueba/ui/pages/auth/auth_page.dart';
import 'package:prueba/ui/pages/home/home_page.dart';
import 'package:prueba/ui/pages/profile/components/profile_form_location_page.dart';
import 'package:prueba/ui/pages/profile/profile_page.dart';
import 'package:prueba/ui/pages/register/components/register_form_profile_screen.dart';
import 'package:prueba/ui/pages/register/register_screen.dart';
import 'package:prueba/ui/pages/users/users_page.dart';

class AppRoutes {
  AppRoutes._();
  static Map<String, Widget Function(BuildContext)> routes = {
    Routes.auth: (BuildContext context) => const AuthPage(),
    Routes.register: (BuildContext context) => const RegisterScreen(),
    Routes.registerForm: (BuildContext context) => const RegisterFormProfileScreen(),
    Routes.home: (BuildContext context) => const HomePage(),
    Routes.users: (BuildContext context) => const UsersPage(),
    Routes.profile: (BuildContext context) => const ProfilePage(),
    Routes.authState: (BuildContext context) => const AuthStateChanges(),
    Routes.createLocation: (BuildContext context) => const ProfileFormLocationPage(),
  };
}