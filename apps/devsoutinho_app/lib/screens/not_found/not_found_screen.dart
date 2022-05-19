import 'package:devsoutinho_ui/devsoutinho_ui.dart';

class NotFoundCustom extends StatelessWidget {
  static const routeName = '/404';
  const NotFoundCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          '404 Not found Screen Custom!',
          styleSheet: TextStyleSheet(selectable: true),
        ),
      ),
    );
  }
}
