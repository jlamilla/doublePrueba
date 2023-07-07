
abstract class AuthRepository {
  Future <String> addSessionUser(String email, String password);
  Future <String> signInEmailAndPassword(String email, String password);
  Future <bool> signOut();
  Stream userSessionChanges();
}