import 'dart:async';

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
  List<Player> players = [];

  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
      () => setState(() => {
            players = [
              Player(name: "Mario", score: 40, background: DeckColors.red),
              Player(name: "Amanda", score: 40, background: DeckColors.blue),
            ]
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    var router = UseRouter(context);

    return Scaffold(
      body: Box(
        styleSheet: const StyleSheet(position: {Breakpoints.xs: "relative"}),
        children: [
          Box(
            styleSheet: const StyleSheet(
              flexDirection: {
                Breakpoints.xs: "column",
                Breakpoints.md: "row",
              },
              crossAxisAlignment: {Breakpoints.xs: "stretch"},
            ),
            children: (players.isEmpty)
                ? [
                    const Box(
                      styleSheet: StyleSheet(
                        flex: {Breakpoints.xs: 1},
                        flexDirection: {Breakpoints.xs: "column"},
                        mainAxisAlignment: {Breakpoints.xs: "center"},
                        crossAxisAlignment: {Breakpoints.xs: "center"},
                      ),
                      children: [
                        CircularProgressIndicator(),
                      ],
                    )
                  ]
                : players
                    .map((player) => PlayerArea(
                          playerName: player.name,
                          score: player.score,
                          background: player.background.toString(),
                          onDecrement: () => setState(() => player.score--),
                          onIncrement: () => setState(() => player.score++),
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
  final Function? onDecrement;
  final Function? onIncrement;

  const PlayerArea({
    Key? key,
    required this.playerName,
    required this.score,
    required this.background,
    this.onIncrement,
    this.onDecrement,
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
            Box(
              styleSheet: const StyleSheet(
                marginTop: {Breakpoints.xs: "10px"},
                flexDirection: {Breakpoints.xs: "row"},
              ),
              children: [
                Button(
                  '+',
                  onPressed: () => (onIncrement != null) && onIncrement!(),
                ),
                Button(
                  '-',
                  onPressed: () => (onDecrement != null) && onDecrement!(),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
