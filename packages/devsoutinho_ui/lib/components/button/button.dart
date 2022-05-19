import 'package:devsoutinho_ui/devsoutinho_ui.dart';
import 'package:flutter/material.dart' as flutter;

class Button extends StatelessWidget {
  final String data;
  final void Function()? onPressed;

  const Button(
    this.data, {
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return flutter.ElevatedButton(
      style: flutter.ElevatedButton.styleFrom(onSurface: Colors.red),
      onPressed: () {
        // ignore: avoid_print
        print('Button pressed');

        if (onPressed != null) onPressed!();
      },
      child: Text(data, styleSheet: TextStyleSheet(selectable: false)),
    );
  }
}
