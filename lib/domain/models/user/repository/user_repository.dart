import 'package:prueba/domain/models/user/location_model.dart';
import 'package:prueba/domain/models/user/user_model.dart';

abstract class UserRepository {
  Future addUser(User user, Location location);
  Future <List<User>> getUsers();
  Future <List<Location>> getUserLocation(String idUser);
  Future <User?> getUserId(String idUser);
  Future <User?> getUserEmail(String email);
  Future <bool> updateUserLocation(Location location, String idUser);
}