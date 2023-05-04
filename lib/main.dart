import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelveapp/auth_controller.dart';
import 'package:travelveapp/bookapackage.dart';
import 'package:travelveapp/chatpage.dart';
import 'package:travelveapp/findaccomodation.dart';
import 'package:travelveapp/homescreen.dart';
import 'package:travelveapp/login.dart';
import 'package:travelveapp/privacypage.dart';
import 'package:travelveapp/register.dart';
import 'package:travelveapp/splashscreen.dart';
import 'package:travelveapp/upload.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Travel+ve',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/home': (context) => HomeScreen(email: '',),
        '/upload':(context) => UploadPage(),
        '/book':(context) => BookPackagePage(),
        '/accomodation':(context) => FindAccommodationPage(),
        '/privacy':(context) => PrivacyPolicyPage(),
        '/chatpage':(context) => ChatPage(),
      },
    );
  }
}
