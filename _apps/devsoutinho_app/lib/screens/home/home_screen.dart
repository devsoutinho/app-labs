import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:devsoutinho_ui/devsoutinho_ui.dart';

class Album {
  final int userId;
  final int id;
  final String title;

  const Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}

Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

// ============================================

class HomeScreen extends StatefulWidget {
  static const routeName = '/';

  const HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map> myProducts = List.generate(
      100,
      (index) => {
            "id": index + 1,
            "name": "Video ${index + 1}",
            "color": Colors.red[Random().nextInt(9) * 100]
          }).toList();

  late Future<Album> futureAlbum;
  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    print(futureAlbum);

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
            padding: EdgeInsets.symmetric(
              horizontal: valueForBreakpoint({
                Breakpoints.xs: 16,
                Breakpoints.lg: 100,
              }, context),
              vertical: 16,
            ),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: valueForBreakpoint({
                  Breakpoints.xs: 1,
                  Breakpoints.md: 2,
                }, context),
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 2.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Card(
                    // generate blues with random shades
                    color: Colors.white,
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
