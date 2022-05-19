import 'package:devsoutinho_app/screens/home/home_screen.dart';
import 'package:devsoutinho_app/screens/not_found/not_found_screen.dart';
import 'package:devsoutinho_ui/devsoutinho_ui.dart';
import 'package:web_navigation/web_navigation.dart';
import './modules//magic_counter/screens/home/home_screen.dart'
    as module_magic_counter;

void main() {
  usePathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WebNavigationRouter router = WebNavigationRouter(context);
    // Routes =============================
    router.addRoute(
      routeName: HomeScreen.routeName,
      routeBuilder: (BuildContext context) =>
          const HomeScreen(title: 'Home Page | DevSoutinho'),
    );
    router.addRoute(
      routeName: '/apps/magic-counter',
      routeBuilder: (BuildContext context) =>
          const module_magic_counter.HomeScreen(
              title: 'Magic Counter | DevSoutinho'),
    );
    router.addRoute(
      routeName: NotFoundCustom.routeName,
      routeBuilder: (BuildContext context) => const NotFoundCustom(),
    );
    // ====================================

    return MaterialApp(
      title: 'DevSoutinho',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      onGenerateRoute: router.onGenerateRoute,
    );
  }
}
