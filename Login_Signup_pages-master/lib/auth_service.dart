import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;


  Future<UserCredential?> loginWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();
      

      if (googleUser == null) {
        return null; 
      }

      final googleAuth = await googleUser.authentication;

      final cred = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken, 
        accessToken: googleAuth.accessToken,
      );


      return await _auth.signInWithCredential(cred);
    } catch (e) {
      print('Error during Google sign-in: ${e.toString()}');
      return null;
    }
  }

  Future<User?> createUserWithEmailAndPassword(String email, String password) async {
    if (!_validateEmail(email)) {
      print('Invalid email format');
      return null;
    }
    if (!_validatePassword(password)) {
      print('Password too weak');
      return null;
    }

    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print('Error creating user with email and password: $e');
      return null;
    }
  }

  // Function to sign out
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print('Error signing out: $e');
    }
  }


  User? getCurrentUser() {
    return _auth.currentUser;
  }


  Future<UserCredential?> signInAnonymously() async {
    try {
      return await _auth.signInAnonymously();
    } catch (e) {
      print('Error during anonymous sign-in: $e');
      return null;
    }
  }

  Stream<User?> get authStateChanges {
    return _auth.authStateChanges();
  }


  bool _validateEmail(String email) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegex.hasMatch(email);
  }

  bool _validatePassword(String password) {
    return password.length >= 6;
  }
}
