import 'package:devsoutinho_ui/devsoutinho_ui.dart';
import 'package:web_navigation/web_navigation.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/';

  const HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var router = UseRouter(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(widget.title, styleSheet: TextStyleSheet()),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Box(
              styleSheet:
                  const StyleSheet(marginBottom: {Breakpoints.xs: "10px"}),
              children: [
                Text(
                  'Welcome to my first app',
                  styleSheet: TextStyleSheet(
                    selectable: true,
                  ),
                ),
              ],
            ),
            Button(
              'App: Magic Counter',
              onPressed: () => {router.push('/apps/magic_counter/')},
            ),
            Button(
              'Not Found Page',
              onPressed: () => {router.push('/apps/any-not-found-page/')},
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
