import 'package:flutter/material.dart';

class UseRouter {
  final BuildContext context;

  const UseRouter(this.context);

  push(String newPath) {
    Navigator.pushNamed(
      context,
      newPath,
    );
  }
}
