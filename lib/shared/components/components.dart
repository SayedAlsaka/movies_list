import 'package:flutter/material.dart';

void navigatePush(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);