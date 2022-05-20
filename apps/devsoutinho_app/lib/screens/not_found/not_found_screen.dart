import 'package:devsoutinho_ui/devsoutinho_ui.dart';
import 'package:web_navigation/core/use_router.dart';

class NotFoundCustom extends StatelessWidget {
  static const routeName = '/404';
  const NotFoundCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var router = UseRouter(context);

    return Scaffold(
      body: Box(
        styleSheet: const StyleSheet(
          flexDirection: {Breakpoints.xs: "column"},
          mainAxisAlignment: {Breakpoints.xs: "center"},
          crossAxisAlignment: {Breakpoints.xs: "stretch"},
          margin: {Breakpoints.xs: "10px"},
          padding: {Breakpoints.xs: "10px"},
        ),
        children: [
          Box(
            styleSheet: const StyleSheet(
              flex: {Breakpoints.xs: 1},
              mainAxisAlignment: {Breakpoints.xs: "center"},
              crossAxisAlignment: {Breakpoints.xs: "center"},
              flexDirection: {Breakpoints.xs: "column"},
              backgroundColor: {Breakpoints.xs: "#AAAAAA"},
              color: {Breakpoints.xs: "#FFFFFF"},
            ),
            children: [
              Text(
                '404 Not found Screen Custom!',
                styleSheet: TextStyleSheet(selectable: true),
              ),
              Box(
                styleSheet: const StyleSheet(
                  marginTop: {Breakpoints.xs: "10px"},
                ),
                children: [
                  Button(
                    "Back to home",
                    onPressed: () => router.push('/'),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
