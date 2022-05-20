import 'package:box_widget/components/box/utils/box_base_styles.dart';
import 'package:box_widget/components/box/utils/child_decorator.dart';
import 'package:box_widget/components/box/utils/get_active_breakpoint.dart';
import 'package:box_widget/components/box/utils/stylesheet.dart';
import 'package:flutter/material.dart';

class Box extends StatelessWidget {
  final List<Widget>? children;
  final StyleSheet styleSheet;
  final BoxBaseStyles? externalStyles;
  final VoidCallback? onPress;

  const Box({
    Key? key,
    this.children = const [],
    this.styleSheet = const StyleSheet(),
    this.externalStyles,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var activeBreakpoint = getActiveBreakpoint(context);
    BoxBaseStyles styles = BoxBaseStyles(
      activeBreakpoint: activeBreakpoint,
      styleSheet: styleSheet,
    );
    if (externalStyles != null) {
      styles = externalStyles as BoxBaseStyles;
    }

    return DefaultTextStyle.merge(
      style: TextStyle(
        color: styles.color,
        fontSize: styles.fontSize,
        fontWeight: styles.fontWeight,
      ),
      child: withPositioned(
        styles: styles,
        child: withFlexible(
          styles: styles,
          child: withGestures(mainWidget(styles)),
        ),
      ),
    );
  }

  Widget withGestures(Widget child) {
    if (onPress != null) {
      return GestureDetector(
        onTap: onPress,
        child: child,
      );
    }
    return child;
  }

  Widget withPositioned({required Widget child, required styles}) {
    if (styles.position == 'absolute') {
      // .fill ?
      return Positioned(
        top: styles.top,
        left: styles.left,
        right: styles.right,
        bottom: styles.bottom,
        child: LayoutBuilder(builder: (context, constraints) {
          // ignore: todo
          // TODO: Implement percentage in future
          return Padding(
            padding: const EdgeInsets.only(
              left: 0,
              bottom: 0,
              top: 0,
              right: 0,
            ),
            child: child,
          );
        }),
      );
    }
    return child;
  }

  Widget withFlexible({required Widget child, required BoxBaseStyles styles}) {
    if (styles.flex != null) {
      return Expanded(
        flex: styles.flex,
        child: child,
      );
    }
    return child;
  }

  mainWidget(BoxBaseStyles styles) {
    // GestureDetector
    return Container(
      width: styles.width,
      height: styles.height,
      margin: EdgeInsets.only(
        bottom: styles.marginBottom,
        left: styles.marginLeft,
        right: styles.marginRight,
        top: styles.marginTop,
      ),
      padding: EdgeInsets.only(
        bottom: styles.paddingBottom,
        left: styles.paddingLeft,
        right: styles.paddingRight,
        top: styles.paddingTop,
      ),
      decoration: BoxDecoration(
        color: styles.backgroundColor,
        boxShadow: [
          BoxShadow(
            color: styles.boxShadowColor,
            spreadRadius: styles.boxShadowSpread,
            blurRadius: styles.boxShadowBlur,
            offset: Offset(styles.boxShadowOffsetX, styles.boxShadowOffsetY),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(styles.borderRadiusTopLeft),
          topRight: Radius.circular(styles.borderRadiusTopRight),
          bottomLeft: Radius.circular(styles.borderRadiusBottomLeft),
          bottomRight: Radius.circular(styles.borderRadiusBottomRight),
        ),
      ),
      child: children!.isNotEmpty
          ? ChildDecorator(
              styles: styles,
              flexDirection: styles.flexDirection,
              position: styles.position,
              crossAxisAlignment: styles.crossAxisAlignment,
              mainAxisAlignment: styles.mainAxisAlignment,
              children: children as List<Widget>,
            )
          : null,
    );
  }
}
