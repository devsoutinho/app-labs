import 'dart:math';

import 'package:devsoutinho_ui/devsoutinho_ui.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/';

  const HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map> myProducts = List.generate(
      100, (index) => {"id": index + 1, "name": "Video ${index + 1}"}).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(widget.title),
            ),
            elevation: 1,
            pinned: true,
            centerTitle: true,
            expandedHeight: 400,
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 2.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Card(
                    // generate blues with random shades
                    color: Colors.red[Random().nextInt(9) * 100],
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(myProducts[index]["name"]),
                    ),
                  );
                },
                childCount: myProducts.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
