import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'package:devsoutinho_ui/devsoutinho_ui.dart';

class Post {
  final String id;
  final String url;
  final String title;

  const Post({
    required this.id,
    required this.url,
    required this.title,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: (json['url'] as String).replaceAll('https://youtu.be/', ''),
      url: json['url'],
      title: json['title'],
    );
  }
}

Future<List<Post>> fetchPosts() async {
  var body = {
    "query": '''
      query {
        youtubeVideos(input: {
          limit: 100,
          offset: 1,
        }) {
          title
          url
        }
      }
    ''',
    "variables": {},
  };
  final response = await http.post(
    Uri.parse('https://api.mariosouto.com/api/graphql'),
    body: jsonEncode(body),
    headers: {
      'Content-Type': 'application/json',
    },
  );

  if (response.statusCode == 200) {
    var posts = json
        .decode(utf8.decode(response.bodyBytes))["data"]["youtubeVideos"]
        .map<Post>((post) {
      return Post.fromJson(post);
    }).toList();
    return posts;
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
  List<Post> posts = [];

  @override
  void initState() {
    super.initState();
    fetchPosts().then((value) => setState(() => posts = [...posts, ...value]));
  }

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
                  Breakpoints.md: 3,
                }, context),
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 4 / 3,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Card(
                    color: Colors.white,
                    child: InkWell(
                      onTap: () async {
                        var url = posts[index].url;
                        await launchUrl(
                          Uri.parse(url),
                          mode: LaunchMode.externalApplication,
                        );
                      },
                      child: Column(
                        children: [
                          AspectRatio(
                            aspectRatio: 16 / 9,
                            child: Image.network(
                              "https://i.ytimg.com/vi/${posts[index].id}/maxresdefault.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(16),
                            alignment: Alignment.center,
                            child: Text(posts[index].title),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                childCount: posts.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
