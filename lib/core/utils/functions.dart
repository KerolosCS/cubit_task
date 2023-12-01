import 'package:flutter/material.dart';

void showSnackBar(String txt, context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(txt),
    ),
  );
}
