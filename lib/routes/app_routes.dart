import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../features/auth/screens/login_screen.dart';
import '../features/auth/screens/otp_screen.dart';
import '../features/auth/screens/role_selection_screen.dart';
import '../features/dashboard/screens/nri_dashboard.dart'; // optional

final List<GetPage> appRoutes = [
  GetPage(name: '/login', page: () => LoginScreen()),
  GetPage(name: '/otp', page: () => OTPScreen(verificationId: '', phone: '')), // updated dynamically
  GetPage(name: '/selectRole', page: () => RoleSelectionScreen()),
  GetPage(name: '/nriDashboard', page: () => NRIDashboard()),
];

