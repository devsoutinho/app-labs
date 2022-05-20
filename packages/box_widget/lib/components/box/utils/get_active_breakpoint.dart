import 'package:box_widget/components/box/utils/breakpoints.dart';
import 'package:flutter/material.dart';

Breakpoints getActiveBreakpoint(BuildContext context) {
  var screenSize = MediaQuery.of(context).size.width;
  var activeBreakpoint = getCurrentBreakpoint(screenSize);

  return activeBreakpoint;
}
