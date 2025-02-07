import 'package:flutter/material.dart';
import 'CatFoodType.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;

  void _login() {
    if (_formKey.currentState?.validate() ?? false) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('เข้าสู่ระบบสำเร็จ!')),
      );

      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const CatFoodType(
                  catName: '',
                  catImageUrl: '',
                )),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
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
            child: const Padding(
              padding: EdgeInsets.only(top: 60.0, left: 22),
              child: Text(
                'ยินดีต้อนรับ!',
                style: TextStyle(
                  fontSize: 30,
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const Positioned(
            top: 70.0,
            right: 20.0,
            child: Image(
              image: AssetImage('assets/CatLook.png'),
              width: 160,
              height: 160,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200.0),
            child: SingleChildScrollView(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  color: Colors.white,
                ),
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height - 200,
                ),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildEmailField(),
                        const SizedBox(height: 20),
                        _buildPasswordField(),
                        const SizedBox(height: 20),
                        const Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'ลืมรหัสผ่าน?',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Color(0xff281537),
                            ),
                          ),
                        ),
                        const SizedBox(height: 70),
                        _buildLoginButton(),
                        const SizedBox(height: 150),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      controller: _emailController,
      decoration: InputDecoration(
        suffixIcon: _emailController.text.isNotEmpty
            ? (_validateEmail(_emailController.text)
                ? const Icon(Icons.check, color: Colors.green)
                : const Icon(Icons.error, color: Colors.red))
            : null,
        label: const Text(
          'Gmail',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(color: Colors.grey),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return null;
        } else if (!RegExp(r'^[a-zA-Z0-9@.]+$').hasMatch(value)) {
          return 'กรุณากรอกอีเมลเป็นภาษาอังกฤษ';
        } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
          return 'กรุณากรอกอีเมลที่ถูกต้อง';
        }
        return null;
      },
      onChanged: (value) {
        setState(() {});
      },
    );
  }

  bool _validateEmail(String email) {
    return RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email);
  }

  Widget _buildPasswordField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: !_passwordVisible,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(
            _passwordVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey,
          ),
          onPressed: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
        ),
        label: const Text(
          'Password',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(color: Colors.grey),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'กรุณากรอกรหัสผ่านของคุณ';
        } else if (value.length < 6) {
          return 'รหัสผ่านต้องมีอย่างน้อย 6 ตัวอักษร';
        }
        return null;
      },
    );
  }

  Widget _buildLoginButton() {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(255, 255, 146, 197),
            Color.fromARGB(255, 100, 201, 248),
          ],
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: ElevatedButton(
        onPressed: _login,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 100),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: const Text(
          'ลงชื่อเข้าใช้',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),
    );
  }

  void saveData() {
    final email = _emailController.text.toString().trim();
    final password = _passwordController.text.toString().trim();

    debugPrint('$email $password');
  }
}
