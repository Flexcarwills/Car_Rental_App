import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.carname});

  final String? carname;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        carname!,
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
