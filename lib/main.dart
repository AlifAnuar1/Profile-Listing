import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:profile_listing/view/pages/home_page.dart';
import 'package:profile_listing/utils/styles.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Listing',
      debugShowCheckedModeBanner: false,
      theme: apptheme,
      home: HomePage(),
    );
  }
}

final ThemeData apptheme = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.primary,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
);
 