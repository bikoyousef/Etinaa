import 'package:flutter/material.dart';

class CardTextY extends StatelessWidget {
  const CardTextY({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.start,
      style: Theme.of(context).textTheme.headline5?.copyWith(
            color: Theme.of(context).colorScheme.secondary,
          ),
    );
  }
}