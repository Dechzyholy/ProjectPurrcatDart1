import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Function to sign in with Google
  Future<UserCredential?> loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      
      // Check if the user canceled the sign-in
      if (googleUser == null) {
        return null; // User canceled sign-in
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Get credentials
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken, 
        accessToken: googleAuth.accessToken,
      );

      // Sign in with Firebase using the Google credentials
      return await _auth.signInWithCredential(credential);
    } catch (e) {
      print('Error logging in with Google: $e');
      return null;
    }
  }

  // Function to create a user with email and password
  Future<User?> createUserWithEmailAndPassword(String email, String password) async {
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

  // Function to sign in with email and password
  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print('Error signing in with email and password: $e');
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

  // Function to check if the user is currently signed in
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  // Function to sign in anonymously
  Future<UserCredential?> signInAnonymously() async {
    try {
      return await _auth.signInAnonymously();
    } catch (e) {
      print('Error during anonymous sign-in: $e');
      return null;
    }
  }

  // Stream to get the authentication state changes
  Stream<User?> get authStateChanges {
    return _auth.authStateChanges();
  }
}
