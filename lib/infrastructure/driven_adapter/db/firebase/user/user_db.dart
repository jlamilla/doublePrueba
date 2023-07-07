import 'dart:async';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prueba/domain/models/user/location_model.dart';
import 'package:prueba/domain/models/user/repository/user_repository.dart';
import 'package:prueba/domain/models/user/user_model.dart';
import 'package:prueba/infrastructure/driven_adapter/db/firebase/user/errors/user_db_error.dart';
import 'package:prueba/ui/constants/collections.dart';

class UserFirebase extends UserRepository {

  final _firestore = FirebaseFirestore.instance;

  @override
  Future addUser(User user, Location location) async{
    bool validateComplete = false;
    try {
      await _firestore.collection(Collections.users).doc(user.id).set(user.toMap());
      await _firestore.collection(Collections.users).doc(user.id).collection(Collections.userLocations).doc().set(location.toMap()).whenComplete(() => validateComplete=true);
    } catch (e){
      log(e.toString());
      throw GetUserDbError();
    }
    return validateComplete;
  }

  @override
  Future <List<Location>> getUserLocation(String idUser) async{
    try{
      final locations = <Location>[];
      final locationData = await _firestore.collection(Collections.users).doc(idUser).collection(Collections.userLocations).get();
      for(final location in locationData.docs){
        final temp = Location.fromMap(location.data());
        temp.id = location.id;
        locations.add(temp);
      }
      return locations;
    }catch(e){
      log(e.toString());
      throw GetUserLocationsDbError();
    }
  }

  @override
  Future <List<User>> getUsers() async{
    try{
      final users = <User>[];
      final usersData = await _firestore.collection(Collections.users).get();
      for(final user in usersData.docs){
        final temp = User.fromMap(user.data());
        temp.id = user.id;
        users.add(temp);
      }
      return users;
    }catch(e){
      log(e.toString());
      throw GetUserDbError();
    }
  }
  
  @override
  Future <User> getUserId(String idUser) async {
    try{
      final userData = await _firestore.collection(Collections.users).doc(idUser).get();
      final temp = User.fromMap(userData.data()!);
      temp.id = userData.id;
      return temp;
    }catch(e){
      log(e.toString());
      throw GetUserByIdDbError();
    }
  }
  
  @override
  Future<User?> getUserEmail(String email) async{
    try{
      User? userProfile;
      final userData = await _firestore.collection(Collections.users).where('email',isEqualTo: email).get();
      for(var user in userData.docs){
        userProfile =  User.fromMap(user.data());
      }
      return userProfile;
    }catch(e){
      log(e.toString());
      throw GetUserByEmailDbError();
    }
  }
  
  @override
  Future <bool>updateUserLocation(Location location, String idUser) async{
    bool validateComplete = false;
    try{
      await _firestore.collection(Collections.users).doc(idUser).collection(Collections.userLocations).doc(location.id).set(location.toMap()).whenComplete(() => validateComplete = true);
    }catch(e){
      log(e.toString());
      throw UpdateUserDbError();
    }
    return validateComplete;
  }
}