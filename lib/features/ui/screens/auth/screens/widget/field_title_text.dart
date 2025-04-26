import 'package:flutter/material.dart';


class FieldTitle extends StatelessWidget {
  const FieldTitle({
    super.key, required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text,
        style: Theme.of(context).textTheme.labelMedium,
        children: [
          TextSpan(
            text: ' *',
            style: TextStyle(
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}