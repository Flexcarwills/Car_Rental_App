import 'dart:async';
import 'package:car_rental_app/Introduciton/onboardingScreen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animatedController;
  late final Animation<Offset> animation;

  @override
  void initState() {
    super.initState();

    // Initialized an animation for once when the app Starts
    _animatedController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    // Created an animation point from where it will start and end.
    animation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0, 1.5),
    ).animate(
      CurvedAnimation(parent: _animatedController, curve: Curves.bounceInOut),
    );

    // Setted a Timer on Splash Screen whenever opens it will change the Screen After a specified seconds of time using a Timer class.
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnBoardingScreen()),
      );
    });
    _animatedController.forward();
  }

  @override
  void dispose() {
    _animatedController.dispose();

    super.dispose();
  }

  Widget? content;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SlideTransition(
        position: animation,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/images/Car-Rental-icon.jpg',
            width: 200,
          ),
        ),
      ),
    );

    // Here Instead of Center Widget we can return an Stram Builder to return a different Screens Based on users Logout and login state.
    //backgroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
    // body: FadeTransition(
    //   opacity: animation!,
    //   child: Center(
    //     child: Image.asset(
    //       'assets/images/Car-Rental-icon.jpg',
    //       width: 300,
    //     ),
    //   ),
    // ),
    //);
  }
}
