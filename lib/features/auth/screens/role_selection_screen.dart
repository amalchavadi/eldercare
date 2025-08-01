import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RoleSelectionScreen extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void _selectRole(String role) async {
    User? user = _auth.currentUser;

    if (user != null) {
      await _firestore.collection('users').doc(user.uid).set({
        'phone': user.phoneNumber,
        'role': role,
        'createdAt': Timestamp.now(),
      });

      Get.snackbar('Success', 'Logged in as $role');

      // Redirect to appropriate dashboard (placeholder)
      if (role == 'NRI') {
        Get.offAllNamed('/nriDashboard');
      } else {
        Get.offAllNamed('/volunteerDashboard');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select Role')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 40),
            const Text('Who are you?', style: TextStyle(fontSize: 22)),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () => _selectRole('NRI'),
              icon: const Icon(Icons.person),
              label: const Text('I’m a Family Member (NRI)'),
              style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50)),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () => _selectRole('Volunteer'),
              icon: const Icon(Icons.volunteer_activism),
              label: const Text('I’m a Volunteer / Caregiver'),
              style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50)),
            ),
          ],
        ),
      ),
    );
  }
}
