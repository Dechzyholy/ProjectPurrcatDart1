import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:untitled3/regScreen.dart';
import 'LoginScreen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => WelcomeScreenState();
}

class WelcomeScreenState extends State<WelcomeScreen> {
  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      return userCredential.user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 255, 146, 197),
              Color.fromARGB(255, 100, 201, 248),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 50.0),
              child: Image(
                image: AssetImage('assets/Logo.png'),
                width: 250,
                height: 250,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Purrfect Cat',
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(height: 30),
            _buildButton(
              text: 'ลงชื่อเข้าใช้',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              },
              icon: Icons.login,
              backgroundColor: Colors.black,
            ),
            const SizedBox(height: 10),
            _buildButton(
              text: 'ลงทะเบียน',
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const RegScreen()));
              },
              icon: Icons.app_registration,
              backgroundColor: const Color.fromARGB(0, 255, 255, 255),
              borderColor: Colors.black,
              textColor: const Color.fromARGB(255, 255, 255, 255),
            ),
            const SizedBox(height: 60),
            _buildButton(
              text: 'เข้าสู่ระบบด้วย Google',
              onPressed: () {
                signInWithGoogle().then((user) {
                  if (user != null) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WelcomeBackScreen(user)));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Google Sign-In Failed')));
                  }
                });
              },
              icon: Icons.account_circle,
              backgroundColor: Colors.white,
              textColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton({
    required String text,
    required VoidCallback onPressed,
    required IconData icon,
    Color backgroundColor = Colors.black,
    Color textColor = Colors.white,
    Color? borderColor,
  }) {
    return ElevatedButton.icon(
      icon: Icon(icon, color: textColor),
      label: Text(
        text,
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: textColor),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        minimumSize: const Size(320, 53),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: borderColor != null
              ? BorderSide(color: borderColor)
              : BorderSide.none,
        ),
        elevation: 5, // Adding shadow effect
      ),
      onPressed: onPressed,
    );
  }
}

class WelcomeBackScreen extends StatelessWidget {
  final User user;
  const WelcomeBackScreen(this.user, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Welcome')),
      body: Center(
          child: Text('Welcome back, ${user.displayName}!',
              style: TextStyle(fontSize: 24))),
    );
  }
}
