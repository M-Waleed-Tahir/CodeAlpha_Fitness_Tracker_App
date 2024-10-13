// ignore_for_file: unused_import
import 'package:fitness_tracker_app/ProfilePage/PrivacyPolicy.dart';
import 'package:fitness_tracker_app/ProfilePage/SettingsPage.dart';
import 'package:fitness_tracker_app/ProfilePage/profilePage.dart';
import 'package:fitness_tracker_app/screens/ActivityScreen/activityscreen.dart';
import 'package:fitness_tracker_app/screens/GoalScreen/GoalScreen.dart';
import 'package:fitness_tracker_app/screens/Login_Signup/LoginSignup.dart';
import 'package:fitness_tracker_app/screens/Login_Signup/forgotpassword.dart';
import 'package:fitness_tracker_app/screens/OnBoardingScreen/onboarding_screen.dart';
import 'package:fitness_tracker_app/screens/WeightScreen/weightscreen.dart';
import 'package:fitness_tracker_app/screens/homeScreen/Notifications.dart';
import 'package:fitness_tracker_app/screens/homeScreen/bottomNavigationbar.dart';
import 'package:fitness_tracker_app/screens/homeScreen/homescreen.dart';
import 'package:fitness_tracker_app/screens/workoutCategories.dart';
import 'package:flutter/material.dart';
import 'screens/ProfilePage/PrivacyPolicy.dart';
import 'screens/ProfilePage/SettingsPage.dart';
import 'screens/ageScreen/ageScreen.dart';
import 'screens/genderScreen/genderScreen.dart';
import 'screens/heightScreen/heightScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.black,
      routes: {
        '/onboarding': (context) => OnboardingScreen(),
        '/gender': (context) => Genderscreen(),
        '/age': (context) => Agescreen(),
        '/height': (context) => Heightscreen(),
        '/weight': (context) => Weightscreen(),
        '/activity': (context) => Activityscreen(),
        '/goal': (context) => Goalscreen(),
        '/forgotPassword': (context) => Forgotpassword(),
        '/login': (context) => SignUp(),
        '/home': (context) => HomePage(),
        '/notifications': (context) => NotificationPage(),
        '/workoutCategories': (context) => WorkoutCategories(),
        '/bottomNavigationbar': (context) => HomepageNavbar(),
        '/profile': (context) => ProfilePage(),
        '/privacyPolicy': (context) => PrivacyPolicyPage(),
        '/settings': (context) => SettingsPage(),
        '/signup': (context) => SignUp(),
      },
      debugShowCheckedModeBanner: false,
      home: SignUp(),
    );
  }
}
