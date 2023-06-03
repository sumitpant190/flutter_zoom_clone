import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_clone/resources/auth_methods.dart';
import 'package:flutter_zoom_clone/screens/home_screen.dart';
import 'package:flutter_zoom_clone/screens/login_screen.dart';
import 'package:flutter_zoom_clone/screens/video_call_screen.dart';
import 'package:flutter_zoom_clone/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData.dark().copyWith(scaffoldBackgroundColor: backgroundColor),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/video_call': (context) => const VideoCallScreen()
      },
      home: StreamBuilder(
        stream: AuthMethods().authChange,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            return HomeScreen();
          }
          return LoginScreen();
        },
      ),
    );
  }
}
