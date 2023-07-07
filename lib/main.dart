import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:prueba/infrastructure/helpers/app_persistent_store.dart';
import 'app/app_state.dart';

void main() async{
  await _initializeFirebase();
  await AppPersistentStore.initialize();
  runApp(const AppState());
}

_initializeFirebase() {
  WidgetsFlutterBinding.ensureInitialized();
  return Firebase.initializeApp();
}
