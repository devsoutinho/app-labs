import 'package:devsoutinho_app/modules/magic_counter/domain/entities/colors.dart';

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
  final List<Player> players = [
    Player(name: "Mario", score: 20, background: DeckColors.red),
    Player(name: "Amanda", score: 20, background: DeckColors.blue),
  ];

  @override
  Widget build(BuildContext context) {
    var router = UseRouter(context);

    return Scaffold(
      body: Box(
        styleSheet: const StyleSheet(position: {Breakpoints.xs: "relative"}),
        children: [
          Box(
            styleSheet: const StyleSheet(
              flexDirection: {Breakpoints.xs: "row"},
              crossAxisAlignment: {Breakpoints.xs: "stretch"},
            ),
            children: players
                .map((player) => PlayerArea(
                      playerName: player.name,
                      score: player.score,
                      background: player.background.toString(),
                    ))
                .toList(),
          ),
          Box(
            styleSheet: const StyleSheet(
              position: {Breakpoints.xs: "absolute"},
              left: {Breakpoints.xs: "0"},
              right: {Breakpoints.xs: "0"},
              bottom: {Breakpoints.xs: "0"},
            ),
            children: [
              Button(
                "Back to home",
                onPressed: () => router.push('/'),
              )
            ],
          )
        ],
      ),
    );
  }
}

class PlayerArea extends StatelessWidget {
  final String playerName;
  final int score;
  final String background;

  const PlayerArea({
    Key? key,
    required this.playerName,
    required this.score,
    required this.background,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Box(
      styleSheet: const StyleSheet(flex: {Breakpoints.xs: 1}),
      children: [
        Box(
          styleSheet: StyleSheet(
            flexDirection: {Breakpoints.xs: "column"},
            mainAxisAlignment: {Breakpoints.xs: "center"},
            crossAxisAlignment: {Breakpoints.xs: "center"},
            color: {Breakpoints.xs: "#FFFFFF"},
            backgroundColor: {Breakpoints.xs: background},
          ),
          children: [
            Text(playerName),
            Text('$score'),
          ],
        )
      ],
    );
  }
}
