import 'package:prueba/domain/models/user/location_model.dart';
import 'package:prueba/domain/models/user/repository/user_repository.dart';
import 'package:prueba/domain/models/user/user_model.dart';

class UserUseCase {
  final UserRepository _userRepository;
  UserUseCase(this._userRepository);
  Future createUser(User user, Location location) => _userRepository.addUser(user, location);
  Future <List<User>> getUsers() => _userRepository.getUsers();
  Future <List<Location>> getLocations(String idUser) => _userRepository.getUserLocation(idUser);
  Future <User?> getUserById(String idUser) => _userRepository.getUserId(idUser);
  Future <User?> getUserByEmail(String email) => _userRepository.getUserEmail(email);
  Future <bool> updateUserLocation(Location location, String idUser) => _userRepository.updateUserLocation(location, idUser);
}