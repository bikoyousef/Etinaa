import 'package:flutter/material.dart';

class Txt extends StatelessWidget {
  const Txt({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: Theme.of(context)
          .textTheme
          .bodyText2
          ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
    );
  }
}
