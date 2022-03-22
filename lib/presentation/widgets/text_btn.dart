import 'package:flutter/material.dart';

class TextBtn extends StatelessWidget {
  const TextBtn({
    Key? key,
    required this.text,
    required this.onpress,
    required this.txtbtn,
  }) : super(key: key);
  final String text;
  final String txtbtn;

  final VoidCallback onpress;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          text,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        TextButton(
          onPressed: onpress,
          child: Text(
            txtbtn,
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
