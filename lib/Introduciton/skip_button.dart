import 'package:flutter/material.dart';
import 'package:car_rental_app/Data/Details.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key, required this.controller});
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        controller.jumpToPage(Onboardingcontents.length - 1);
      },
      icon: const Icon(Icons.arrow_circle_left_outlined),
      style: IconButton.styleFrom(
        iconSize: 50,
      ),
    );
  }
}


// TextButton.icon(
//       onPressed: () {
//         controller.jumpToPage(TitlesDes.length - 1);
//       },
//       icon: const Icon(Icons.skip_next),
//       label: const Text('Skip'),
//       style: TextButton.styleFrom(
//           iconColor: Theme.of(context).colorScheme.secondary,
//           textStyle: TextStyle(color: Theme.of(context).colorScheme.secondary)),
//     );