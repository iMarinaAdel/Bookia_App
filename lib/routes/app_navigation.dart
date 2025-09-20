import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

pushTo(BuildContext context, String route, [Object? extra]) {
  // Navigator.push(context, MaterialPageRoute(builder: (context) => newPage));
  return context.push(route, extra: extra);
}

pushReplacementTo(BuildContext context, String route, [Object? extra]) {
  // Navigator.pushReplacement(
  //   context,
  //   MaterialPageRoute(builder: (context) => newPage),
  // );
  return context.replace(route, extra: extra);
}

pushAndRemoveUntilTo(BuildContext context, String route, [Object? extra]) {
  // Navigator.pushAndRemoveUntil(
  //   context,
  //   MaterialPageRoute(builder: (context) => newPage),
  //   (route) => false,
  // );
  return context.go(route, extra: extra);
}

popTo(BuildContext context) {
  // Navigator.pop(context);
  return context.pop();
}
