import 'package:flutter/material.dart';
import 'package:prueba/domain/models/user/location_model.dart';
import 'package:prueba/domain/models/user/user_model.dart';
import 'package:prueba/domain/use_cases/auth/auth_use_case.dart';
import 'package:prueba/domain/use_cases/user/user_use_case.dart';
import 'package:prueba/infrastructure/driven_adapter/db/firebase/auth/auth_db.dart';
import 'package:prueba/infrastructure/driven_adapter/db/firebase/user/user_db.dart';
import 'package:prueba/infrastructure/helpers/app_persistent_store.dart';

class UserProvider extends ChangeNotifier {

  String email = '';
  String password = '';
  String userId = '';
  late User? userProfile;
  late User selectUser;

  bool _obscureText = true;

  bool get obscureText => _obscureText;

  set obscureText (bool value){
    _obscureText = value;
    notifyListeners();
  }
  String _searchUsers = '';

  String get searchUsers => _searchUsers;

  set searchUsersClear(String value){
    _searchUsers = value;
  }

  set searchUsers(String value){
    _searchUsers = value;
    notifyListeners();
  }

  final _user = UserUseCase(UserFirebase());
  final _auth = AuthUseCase(AuthFirebase());

  Future <bool> validateEmail() async{ 
    return await _user.getUserByEmail(email) != null;
  }

  Future <List<User>> getUsers() async{
    return await _user.getUsers();
  }

  Future <List<Location>> getLocations(String idUser) async{
    return await _user.getLocations(idUser);
  }

  Future <bool> createUserWithEmailAndPassword() async{
      userId = await _auth.createUserWithEmailAndPassword(email, password);
      return userId.isNotEmpty;
  }

  Future <bool> createUserProfile(User newUser, Location newLocation) async {
    newUser.id = userId;
    return await _user.createUser(newUser, newLocation);
  }

  Future <User?> getUserProfile(String uid) async {
    final user = await _user.getUserById(AppPersistentStore.getUserId() ?? uid);
    return user;
  }

  Future <bool> updateUserLocation(Location location) async {
    return await _user.updateUserLocation(location, selectUser.id!);
  }

  List<User> filter(List<User> users) {

    if(searchUsers.isNotEmpty){
        users = users.where((p) => 
                    p.name.toLowerCase().contains(searchUsers.toLowerCase()) ||
                    p.lastname.toLowerCase().contains(searchUsers.toLowerCase()) ||
                    p.birthdate.toLowerCase().contains(searchUsers.toLowerCase()) ||
                    p.email.toLowerCase().contains(searchUsers.toLowerCase())).toList();
    }
    return users;
  }
}