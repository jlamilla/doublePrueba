import 'package:flutter/cupertino.dart';
import 'package:prueba/domain/use_cases/auth/auth_use_case.dart';
import 'package:prueba/infrastructure/driven_adapter/db/firebase/auth/auth_db.dart';
import 'package:prueba/infrastructure/helpers/app_persistent_store.dart';

class AuthProvider extends ChangeNotifier {

  String email = '';
  String password = '';
  

  bool _obscureText = true;

  bool get obscureText => _obscureText;

  set obscureText (bool value){
    _obscureText = value;
    notifyListeners();
  }

  final _auth = AuthUseCase(AuthFirebase());

  Stream authStateChanges() async*{
    yield _auth.userSessionChanges();
  }
  
  Future <bool> signInEmailAndPassword() async {
    final userId = await _auth.signInEmailAndPassword(email, password);
    if(userId.isNotEmpty){
      AppPersistentStore.setUserId(userId);
      return true;
    }
    return false;
  }

  Future <bool> signOut() async {

    final validate = await _auth.signOut();
    
    if(validate){
      await AppPersistentStore.clear();
    }
    notifyListeners();

    return validate;
  }

}