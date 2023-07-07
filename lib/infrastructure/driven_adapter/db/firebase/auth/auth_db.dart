import 'dart:async';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:prueba/domain/models/auth/repository/auth_repository.dart';
import 'package:prueba/infrastructure/driven_adapter/db/firebase/auth/errors/auth_db_error.dart';

class AuthFirebase extends AuthRepository{

  final _auth = auth.FirebaseAuth.instance;

  @override
  Future <String> addSessionUser(String email, String password) async{
    auth.UserCredential? userCredential;
    try {
      userCredential = await _auth.createUserWithEmailAndPassword( email: email , password: password);
    } on auth.FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw AddSessionUserDbError();
      }
    }
    return (userCredential != null && userCredential.user != null) ? userCredential.user!.uid : '';
  }

  @override
  Future <String> signInEmailAndPassword(String email, String password) async {

    auth.UserCredential? userCredential;
    auth.User ? user;

    try {
      userCredential = await _auth.signInWithEmailAndPassword(email: email,password: password);
      user = userCredential.user;
    } on auth.FirebaseAuthException catch (e) {
      log(e.toString());
    }

    return (user != null) ? user.uid : '';
  }

  @override
  Future <bool> signOut() async{
    bool validateComplete = false;
    try{
      await _auth.signOut().whenComplete(() =>  validateComplete = true );
    }catch(e){
      log(e.toString());
    }
    return validateComplete;
  }
  
  @override
  Stream userSessionChanges() {
    try{
      return auth.FirebaseAuth.instance.authStateChanges();
    }catch(e){
      log(e.toString());
      throw AuthStateChangesDbError();
    }
  }
}