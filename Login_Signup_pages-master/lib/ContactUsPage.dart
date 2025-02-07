import 'package:flutter/material.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({super.key});

  @override
  _ContactUsPageState createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  final _formKey = GlobalKey<FormState>();

  // Text controllers to manage input
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    // Dispose controllers when the widget is disposed
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    if (_formKey.currentState!.validate()) {
      // Process the form data
      print('Name: ${_nameController.text}');
      print('Email: ${_emailController.text}');
      print('Message: ${_messageController.text}');
      // Here you can send the message to a server or an email
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Message sent!')),
      );
      // Clear the text fields
      _nameController.clear();
      _emailController.clear();
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ติดต่อเรา'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Email Instruction
              const Text(
                'กรุณาใส่อีเมลของคุณ:', // Instruction label
                style: TextStyle(fontSize: 20.0), // Optional: Adjust font size
              ),

              // Email Input
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'กรุณาใส่อีเมล';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'กรุณาใส่อีเมลที่ถูกต้อง';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16.0),

              // Message Input
              TextFormField(
                controller: _messageController,
                decoration: const InputDecoration(
                  labelText: 'กรุณาใส่ข้อความของคุณ',
                  border: OutlineInputBorder(),
                ),
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'กรุณาใส่ข้อความ';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 24.0),

              // Send Button
              ElevatedButton(
                onPressed: _sendMessage,
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.black, // Set the button color to black
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0), // Optional: Adjust vertical padding
                  minimumSize: const Size(
                      double.infinity, 0), // Fit the button to full width
                ),
                child: const Text(
                  'ส่งข้อความ',
                  style: TextStyle(
                      color: Colors.white), // Optional: Set text color to white
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
