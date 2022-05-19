import 'package:devsoutinho_app/screens/home/home_screen.dart';
import 'package:devsoutinho_ui/devsoutinho_ui.dart';
import 'utils/web/url_strategy/url_strategy.dart';

void main() {
  usePathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DevSoutinho',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const HomeScreen(title: 'DevSoutinho - Home Page'),
    );
  }
}
