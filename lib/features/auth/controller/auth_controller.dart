import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../screens/otp_screen.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String _verificationId;

  void sendOTP(String phoneNumber) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) async {
          // Auto-sign in for Android
          await _auth.signInWithCredential(credential);
          Get.snackbar('Success', 'Auto-login completed');
        },
        verificationFailed: (FirebaseAuthException e) {
          Get.snackbar('Error', e.message ?? 'Verification failed');
        },
        codeSent: (String verificationId, int? resendToken) {
          _verificationId = verificationId;
          Get.to(() => OTPScreen(verificationId: _verificationId, phone: phoneNumber));
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          _verificationId = verificationId;
        },
      );
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  void verifyOTP(String otp, String verificationId) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otp,
      );
      await _auth.signInWithCredential(credential);
      Get.snackbar('Success', 'Phone verified');
      // TODO: Redirect to role selection screen
    } catch (e) {
      Get.snackbar('Invalid OTP', e.toString());
    }
  }
}
