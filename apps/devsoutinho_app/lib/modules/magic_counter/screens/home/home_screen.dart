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
  int _firstPlayer = 20;
  int _secondPlayer = 20;

  void _decrement(int player) {
    if (player == 1) {
      setState(() {
        _firstPlayer--;
      });
    } else {
      setState(() {
        _secondPlayer--;
      });
    }
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
          children: <Widget>[
            Button(
              'Player 01: $_firstPlayer',
              onPressed: () => _decrement(1),
            ),
            Button(
              'Player 02: $_secondPlayer',
              onPressed: () => _decrement(2),
            ),
            Button(
              'Back to Home Screen',
              onPressed: () => router.push('/'),
            ),
          ],
        ),
      ),
    );
  }
}
