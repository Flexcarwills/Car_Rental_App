import 'package:flutter/material.dart';

class Attributes extends StatelessWidget {
  const Attributes({super.key, required this.value, required this.name});

  final String name, value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          value,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
        ),
        Text(
          name,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}
