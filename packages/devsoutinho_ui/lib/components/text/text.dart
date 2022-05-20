import 'package:commons/Platform/Platform.dart';
import 'package:devsoutinho_ui/devsoutinho_ui.dart';
import 'package:flutter/material.dart' as flutter;

class TextStyleSheet {
  bool selectable = false;

  TextStyleSheet({this.selectable = false});
}

class Text extends StatelessWidget {
  final String data;
  final TextStyleSheet? styleSheet;
  // StyleSheet with Selectable

  const Text(
    this.data, {
    Key? key,
    this.styleSheet,
  }) : super(key: key);

  Widget renderText(bool selectable) {
    if (selectable) {
      return flutter.SelectableText(
        data,
      );
    }
    return flutter.Text(
      data,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isPlatform(CurrentPlatform.web)) {
      if (styleSheet?.selectable == false) {
        return renderText(false);
      }
      return renderText(true);
    }

    return renderText(styleSheet?.selectable == true);
  }
}
