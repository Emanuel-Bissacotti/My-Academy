import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myacademy/firebase_options.dart';
import 'package:myacademy/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Academy',
      theme: ThemeData(
        primaryColor: Colors.black,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: Colors.black,
          ),
        ),
      ),
      home: const LoginScreen(),
    );
  }
}
