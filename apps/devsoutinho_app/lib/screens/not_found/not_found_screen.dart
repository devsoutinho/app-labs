import 'package:devsoutinho_ui/devsoutinho_ui.dart';

class NotFoundCustom extends StatelessWidget {
  static const routeName = '/404';
  const NotFoundCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Box(
        styleSheet: const StyleSheet(
          flexDirection: {Breakpoints.xs: "column"},
          mainAxisAlignment: {Breakpoints.xs: "center"},
          crossAxisAlignment: {Breakpoints.xs: "stretch"},
          margin: {Breakpoints.xs: "10px"},
          padding: {Breakpoints.xs: "10px"},
          backgroundColor: {Breakpoints.xs: "#FF0000"},
          color: {Breakpoints.xs: "#FFFFFF"},
        ),
        children: [
          Box(
            styleSheet: const StyleSheet(
              flex: {Breakpoints.xs: 1},
              flexDirection: {Breakpoints.xs: "column"},
            ),
            children: [
              Text(
                '404 Not found Screen Custom!',
                styleSheet: TextStyleSheet(selectable: true),
              ),
            ],
          ),
          Box(
            styleSheet: const StyleSheet(
              flex: {Breakpoints.xs: 1},
              flexDirection: {Breakpoints.xs: "column"},
            ),
            children: [
              Text(
                '404 Not found Screen Custom!',
                styleSheet: TextStyleSheet(selectable: true),
              ),
            ],
          )
        ],
      ),
    );
  }
}
