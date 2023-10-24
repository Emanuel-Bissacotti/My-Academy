import 'package:flutter/material.dart';

ShowSnackBar(
    {required BuildContext context,
    required String text,
    Color color = Colors.green}) {
  final snackBar = SnackBar(
    content: Text(text),
    backgroundColor: color,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
