import 'package:car_rental_app/Authentication_Screens/authentication.dart';
import 'package:car_rental_app/Home_Widgets/home_scree.dart';
import 'package:car_rental_app/Introduciton/onboardingScreen.dart';

import 'package:car_rental_app/user_screens/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase/project-1-cutomer/firebase_options.dart' as p1;
import 'firebase/project-2-Admin/firebase_options.dart' as p2;
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Error Solved
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await Firebase.initializeApp(
      name: 'project-2', options: p2.DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(220, 67, 186, 233));

var kdarkcolorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 57, 88, 134));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark().copyWith(
          useMaterial3: true,
          colorScheme: kdarkcolorScheme,
          iconButtonTheme: IconButtonThemeData(
            style: IconButton.styleFrom(
                backgroundColor: kdarkcolorScheme.primaryContainer,
                foregroundColor: kdarkcolorScheme.secondary),
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontWeight: FontWeight.bold),
              backgroundColor: kdarkcolorScheme.primaryContainer,
            ),
          ),
          textTheme: const TextTheme(
            headline4: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          )),
      theme: ThemeData().copyWith(
          useMaterial3: true,
          colorScheme: kColorScheme,
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: kColorScheme.onPrimaryContainer,
            foregroundColor: kColorScheme.primaryContainer,
          ),
          iconButtonTheme: IconButtonThemeData(
            style: IconButton.styleFrom(
                backgroundColor: kColorScheme.primaryContainer,
                foregroundColor: kColorScheme.secondary),
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              backgroundColor: kColorScheme.primary,
            ),
          ),
          textTheme: const TextTheme(
            headline4: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )),
      themeMode: ThemeMode.system,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          if (snapshot.connectionState == ConnectionState.active) {
            final user = snapshot.data;
            if (user != null) {
              return const mainscreen();
            } else {
              return const AuthencationScreen();
            }
          }
          if (snapshot.connectionState == ConnectionState.none) {
            return const OnBoardingScreen();
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
