import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;

enum CurrentPlatform {
  android,
  ios,
  web,
  macOS,
  linux,
  windows,
  fuchsia,
  none,
}

bool isPlatform(CurrentPlatform platform) {
  if (kIsWeb) return true;
  if (Platform.isAndroid) return true;
  if (Platform.isIOS) return true;
  return false;
}
