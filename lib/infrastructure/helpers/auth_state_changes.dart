import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba/config/providers/user_provider.dart';
import 'package:prueba/ui/pages/auth/auth_page.dart';
import 'package:prueba/ui/pages/home/home_page.dart';

class AuthStateChanges extends StatelessWidget {

  const AuthStateChanges({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (_, userAuth) {
          if(userAuth.hasData && userAuth.data != null){
            return FutureUserProfile(uid: userAuth.data!.uid);
          }else{
            return const AuthPage();
          }
        }
    );
  }
}

class FutureUserProfile extends StatelessWidget {
  
  const FutureUserProfile({Key? key, required this.uid}) : super(key: key);
  final String uid;
  
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return FutureBuilder(
      future: userProvider.getUserProfile(uid),
      builder: (_,  user) { 
        if(user.hasData){
          userProvider.userProfile = user.data;
          return const HomePage();
        }else{
          return const AuthPage();
        }
      },);
  }
}