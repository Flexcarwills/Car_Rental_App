import 'package:car_rental_app/Authentication_Screens/authentication.dart';
import 'package:car_rental_app/Introduciton/next_button.dart';
import 'package:car_rental_app/Data/Details.dart';
import 'package:car_rental_app/Introduciton/skip_button.dart';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});
  @override
  State<OnBoardingScreen> createState() {
    return _OnBoardingScreenState();
  }
}

class _OnBoardingScreenState extends State<OnBoardingScreen>
    with SingleTickerProviderStateMixin {
  final PageController _controller = PageController(initialPage: 0);
  int currentindex = 0;
  bool animate = false;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isdark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                  controller: _controller,
                  itemCount: Onboardingcontents.length,
                  onPageChanged: (int num) {
                    setState(() {
                      currentindex = num;
                    });
                  },
                  itemBuilder: (ctx, index) {
                    return Padding(
                      padding: const EdgeInsets.all(40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Lottie.asset(Onboardingcontents[index].image,
                              fit: BoxFit.contain, width: 250),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            Onboardingcontents[index].title,
                            textAlign: TextAlign.center,
                            style: isdark
                                ? Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    )
                                : Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            Onboardingcontents[index].description,
                            textAlign: TextAlign.center,
                            style: isdark
                                ? Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w200,
                                      fontSize: 15,
                                    )
                                : Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w200,
                                      fontSize: 15,
                                    ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),

            // Created a dots indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                Onboardingcontents.length,
                (index) => Container(
                  height: 10,
                  width: currentindex == index ? 20 : 8,
                  margin: const EdgeInsets.only(right: 5, bottom: 25),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: currentindex == index
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.secondaryContainer),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: currentindex != Onboardingcontents.length - 1
          ? Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SkipButton(controller: _controller),
                  NextButton(controller: _controller),
                ],
              ),
            )
          : // Created a button with design using Container at bottom
          TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (context, _, __) =>
                            const AuthencationScreen(),
                        transitionDuration: const Duration(seconds: 2),
                        transitionsBuilder:
                            (context, animation, anotherAnimation, child) {
                          animation = CurvedAnimation(
                              curve: Curves.decelerate, parent: animation);

                          return SlideTransition(
                            position: Tween(
                              begin: const Offset(0, 0.3),
                              end: const Offset(0, 0),
                            ).animate(animation),
                            child: child,
                          );
                        }));
              },
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                minimumSize: const Size.fromHeight(80),
              ),
              child: Text(
                'Get Started',
                style: isdark
                    ? Theme.of(context).textTheme.headline4
                    : Theme.of(context).textTheme.headline4,
              )),
    );
  }
}
