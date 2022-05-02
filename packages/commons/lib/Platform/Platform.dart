import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;

enum CurrentPlatform {
  ANDROID,
  IOS,
  WEB,
  MACOS,
  LINUX,
  WINDOWS,
  FUCHSIA,
  NONE,
}

bool isPlatform(CurrentPlatform platform) {
  if (kIsWeb) return true;
  if (Platform.isAndroid) return true;
  if (Platform.isIOS) return true;
  return false;
}
