import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Send OTP
  Future<void> sendOTP({
    required String phone,
    required Function(String) codeSent,
    required Function(String) autoRetrieveTimeout,
    required Function(PhoneAuthCredential) autoVerified,
    required Function(String) onError,
  }) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phone,
      timeout: const Duration(seconds: 60),
      verificationCompleted: autoVerified,
      verificationFailed: (FirebaseAuthException e) => onError(e.message ?? 'Verification failed'),
      codeSent: (String verificationId, int? resendToken) => codeSent(verificationId),
      codeAutoRetrievalTimeout: (String verificationId) => autoRetrieveTimeout(verificationId),
    );
  }

  // Verify OTP
  Future<UserCredential> verifyOTP(String verificationId, String otp) async {
    final credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: otp,
    );
    return await _auth.signInWithCredential(credential);
  }

  // Save role to Firestore
  Future<void> saveUserRole(String role) async {
    final user = _auth.currentUser;
    if (user != null) {
      await _firestore.collection('users').doc(user.uid).set({
        'uid': user.uid,
        'phone': user.phoneNumber,
        'role': role,
        'createdAt': Timestamp.now(),
      }, SetOptions(merge: true));
    }
  }

  // Check if user already has a role
  Future<String?> getUserRole() async {
    final user = _auth.currentUser;
    if (user != null) {
      final doc = await _firestore.collection('users').doc(user.uid).get();
      return doc.exists ? doc['role'] : null;
    }
    return null;
  }

  // Logout
  Future<void> logout() async {
    await _auth.signOut();
  }
}
