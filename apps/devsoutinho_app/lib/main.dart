import 'package:devsoutinho_app/screens/home/home_screen.dart';
import 'package:devsoutinho_ui/devsoutinho_ui.dart';

void main() {
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
      home: const HomeScreen(title: 'Flutter Demo Home Page'),
    );
  }
}
