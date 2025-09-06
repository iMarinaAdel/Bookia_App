import 'package:flutter/material.dart';

class AppNavigation {
  static pushTo(BuildContext context, Widget newPage) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => newPage));
  }

  static pushReplacementTo(BuildContext context, Widget newPage) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => newPage),
    );
  }

  static pushAndRemoveUntilTo(BuildContext context, Widget newPage) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => newPage),
      (route) => false,
    );
  }

  static popTo(BuildContext context) {
    Navigator.pop(context);
  }
}
