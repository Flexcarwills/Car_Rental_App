import 'package:car_rental_app/Authentication_Screens/authentication.dart';
import 'package:car_rental_app/Home_Widgets/home_scree.dart';
import 'package:car_rental_app/Introduciton/onboardingScreen.dart';
import 'package:car_rental_app/Introduciton/splash.dart';
import 'package:car_rental_app/user_screens/main_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

var kColorScheme =
    ColorScheme.fromSeed(seedColor: Color.fromARGB(220, 67, 186, 233));

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
      home: const OnBoardingScreen(),
    );
  }
}
