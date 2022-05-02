import 'package:commons/Platform/Platform.dart';
import 'package:devsoutinho_ui/devsoutinho_ui.dart';
import 'package:flutter/material.dart' as flutter;

class Text extends StatelessWidget {
  final String data;
  // StyleSheet with Selectable

  const Text(
    this.data, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isPlatform(CurrentPlatform.web)) {
      return flutter.SelectableText(
        data,
      );
    }

    return flutter.Text(
      data,
    );
  }
}
