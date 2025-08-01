import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/auth_controller.dart';

class OTPScreen extends StatelessWidget {
  final String verificationId;
  final String phone;

  OTPScreen({required this.verificationId, required this.phone});

  final TextEditingController otpController = TextEditingController();
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Verify OTP')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Text('OTP sent to $phone'),
            const SizedBox(height: 20),
            TextField(
              controller: otpController,
              keyboardType: TextInputType.number,
              maxLength: 6,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter 6-digit OTP',
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                String otp = otpController.text.trim();
                if (otp.length == 6) {
                  authController.verifyOTP(otp, verificationId);
                } else {
                  Get.snackbar('Error', 'Please enter a valid 6-digit OTP');
                }
              },
              child: const Text('Verify'),
            ),
          ],
        ),
      ),
    );
  }
}
