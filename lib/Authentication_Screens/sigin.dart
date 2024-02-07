import 'package:flutter/material.dart';

class SiginButton extends StatefulWidget {
  const SiginButton({super.key, required this.onChange});

  final void Function() onChange;

  @override
  State<SiginButton> createState() => _SiginButtonState();
}

class _SiginButtonState extends State<SiginButton> {
  @override
  Widget build(BuildContext context) {
    final isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return GestureDetector(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 150,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
              color: isDark
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: TextButton(
                onPressed: widget.onChange,
                style:
                    TextButton.styleFrom(backgroundColor: Colors.transparent),
                child: Text('Sign In',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: isDark
                            ? Theme.of(context).colorScheme.secondaryContainer
                            : Theme.of(context).colorScheme.onPrimary)),
              ),
            ),
          ),
          Container(
            width: 150,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
              color: isDark
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextButton(
              onPressed: widget.onChange,
              style: TextButton.styleFrom(backgroundColor: Colors.transparent),
              child: Text('Sign Up',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: isDark
                          ? Theme.of(context).colorScheme.secondaryContainer
                          : Theme.of(context).colorScheme.onPrimary)),
            ),
          ),
        ],
      ),
    );
  }
}
