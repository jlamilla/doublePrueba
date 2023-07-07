import 'package:prueba/domain/models/auth/repository/auth_repository.dart';

class AuthUseCase {
  final AuthRepository _authRepository;
  AuthUseCase(this._authRepository);

  Future <String> createUserWithEmailAndPassword(String email, String password) => _authRepository.addSessionUser(email, password);
  Future <String> signInEmailAndPassword(String email, String password) => _authRepository.signInEmailAndPassword(email,password);
  Future <bool> signOut() => _authRepository.signOut();
  Stream userSessionChanges() => _authRepository.userSessionChanges();
}