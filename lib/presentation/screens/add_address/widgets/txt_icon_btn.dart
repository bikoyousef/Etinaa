import 'package:flutter/material.dart';

class TextIconBtn extends StatelessWidget {
  const TextIconBtn({
    Key? key,
    required this.text,
    required this.onpress,
    required this.icon,
  }) : super(key: key);
  
  final String text;
  final IconData icon;

  final VoidCallback onpress;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onpress,
      icon: Icon(
        icon,
        color: Theme.of(context).colorScheme.secondary,
      ),
      label: Text(
        text,
        style: Theme.of(context).textTheme.bodyText2?.copyWith(
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
