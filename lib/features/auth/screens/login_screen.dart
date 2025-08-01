import 'package:flutter/material.dart';
import 'package:get/get.dart'; // For navigation and state mgmt
import '../controller/auth_controller.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController phoneController = TextEditingController();
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 50),
            const Text(
              'Enter Your Phone Number',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                prefixText: '+91 ',
                border: OutlineInputBorder(),
                hintText: 'Phone number',
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                String phone = '+91' + phoneController.text.trim();
                authController.sendOTP(phone);
              },
              child: const Text('Send OTP'),
            ),
          ],
        ),
      ),
    );
  }
}
