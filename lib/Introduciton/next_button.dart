// import 'package:car_rental_app/Data/Details.dart';
import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key, required this.controller});
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        controller.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.bounceInOut);
      },
      icon: const Icon(Icons.arrow_circle_right_outlined),
      style: IconButton.styleFrom(
        iconSize: 50,
      ),
    );
  }
}


// TextButton.icon(
//       onPressed: () {
//         controller.nextPage(
//             duration: const Duration(milliseconds: 300),
//             curve: Curves.decelerate);
//       },
//       icon: const Icon(Icons.next_plan),
//       label: const Text('Next'),
//       style: TextButton.styleFrom(
//           iconColor: Theme.of(context).colorScheme.secondary,
//           textStyle: TextStyle(color: Theme.of(context).colorScheme.secondary)),
//     );