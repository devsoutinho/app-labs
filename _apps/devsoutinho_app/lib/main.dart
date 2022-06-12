import 'package:devsoutinho_app/screens/home/home_screen.dart';
import 'package:devsoutinho_app/screens/not_found/not_found_screen.dart';
import 'package:devsoutinho_ui/devsoutinho_ui.dart';
import 'package:web_navigation/web_navigation.dart';
import './modules/magic_counter/main.dart' as module_magic_counter;

void main() {
  usePathUrlStrategy();
  runApp(const MyApp());
}

const routes = {
  // App: Main
  HomeScreen.routeName: HomeScreen(title: 'Home Page | DevSoutinho'),
  NotFoundCustom.routeName: NotFoundCustom(),
  // App: Magic Counter
  '/apps/magic_counter${module_magic_counter.HomeScreen.routeName}':
      module_magic_counter.HomeScreen(
    title: 'Magic Counter | DevSoutinho',
  ),
};

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WebNavigationRouter router = WebNavigationRouter(context);
    router.addRoutes(routes);

    return MaterialApp(
      title: 'DevSoutinho',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      onGenerateRoute: router.onGenerateRoute,
    );
  }
}
