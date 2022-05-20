import '../../domain/entities/player.dart';
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
  final List<Player> players = const [
    Player(name: "Mario", score: 20, background: Colors.red),
    Player(name: "Amanda", score: 20, background: Colors.white),
  ];

  @override
  Widget build(BuildContext context) {
    var router = UseRouter(context);

    return Scaffold(
      body: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: players
                .map((player) => PlayerArea(
                      playerName: player.name,
                      score: player.score,
                      background: player.background,
                    ))
                .toList(),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Button(
              "Back to home",
              onPressed: () => router.push('/'),
            ),
          )
        ],
      ),
    );
  }
}

class PlayerArea extends StatelessWidget {
  final String playerName;
  final int score;
  final Color background;

  const PlayerArea({
    Key? key,
    required this.playerName,
    required this.score,
    required this.background,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: background,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(playerName),
            Text('$score'),
          ],
        ),
      ),
    );
  }
}
