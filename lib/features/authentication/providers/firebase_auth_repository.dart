import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_auth_repository.g.dart';

@riverpod
FirebaseAuthRepository firebaseAuthRepository(FirebaseAuthRepositoryRef ref) {
  return FirebaseAuthRepository(ref);
}

class FirebaseAuthRepository {
  FirebaseAuthRepository(this.ref);

  final _auth = FirebaseAuth.instance;
  final FirebaseAuthRepositoryRef ref;

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final credentials = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      if (credentials.user == null) throw Exception('User not found');
    } on FirebaseAuthException catch (e) {
      throw _handleAuthError(e);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      final credentials = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      if (credentials.user == null) throw Exception('User not found');
    } on FirebaseAuthException catch (e) {
      throw _handleAuthError(e);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> forgotPassword(String email) async {
    try {
      return _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw _handleAuthError(e);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOut() {
    return _auth.signOut();
  }

  FirebaseAuthException _handleAuthError(FirebaseAuthException e) {
    switch (e.code) {
      case 'weak-password':
        throw WeakPasswordException();
      case 'email-already-in-use':
        throw EmailAlreadyInUseException();
      case 'too-many-requests':
        throw TooManyRequestsException();
      case 'invalid':
      case 'INVALID_LOGIN_CREDENTIALS':
        throw InvalidCredentialsException();
      default:
        throw DefaultAuthException();
    }
  }
}

@Riverpod(keepAlive: true)
Stream<User?> authStateChanges(AuthStateChangesRef ref) {
  return FirebaseAuth.instance.authStateChanges();
}

sealed class AuthException implements Exception {}

class DefaultAuthException extends AuthException {}

class WeakPasswordException extends AuthException {}

class EmailAlreadyInUseException extends AuthException {}

class TooManyRequestsException extends AuthException {}

class InvalidCredentialsException extends AuthException {}
