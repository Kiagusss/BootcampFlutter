import 'package:flutter/material.dart';
import 'package:pengayaan_7_rest/detail_data.dart';
import 'package:pengayaan_7_rest/model/list_album_model.dart';
import 'package:pengayaan_7_rest/services/materi_services.dart';

Future<List<Post>> postsFuture = MateriServices.getPosts();

class ReadDataPage extends StatefulWidget {
  const ReadDataPage({super.key});

  @override
  State<ReadDataPage> createState() => _ReadDataPageState();
}

class _ReadDataPageState extends State<ReadDataPage> {
  late Future<Post> futureAlbum;
  @override
  void initState() {
    super.initState();
    postsFuture = postsFuture;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "fetch Data list",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Fetch List Data Example"),
        ),
        body: Center(
          child: FutureBuilder(
              future: postsFuture,
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasData) {
                  final posts = snapshot.data!;
                  return buildPosts(posts);
                } else {
                  return const Text("No Data Available");
                }
              }),
        ),
      ),
    );
  }
}

Widget buildPosts(List<Post> posts) {
  return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        return InkWell(
          onTap: () {
            print(post.id);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailReadDataPage(id: post.id)));
          },
          child: Container(
            color: Colors.grey,
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            height: 100,
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Image.network(
                      "https://sanbercode.com/assets/img/identity/logo@2x.jpg"),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(flex: 3, child: Text(post.title!))
              ],
            ),
          ),
        );
      });
}
