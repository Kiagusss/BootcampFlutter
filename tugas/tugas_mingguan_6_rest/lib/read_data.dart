import 'package:flutter/material.dart';
import 'package:pengayaan_7_rest/detail_data.dart';
import 'package:pengayaan_7_rest/model/comment_mode.dart';
import 'package:pengayaan_7_rest/services/comment_services.dart';

Future<List<Comment>> commentFuture = CommentServices.getComments();

class ReadDataPage extends StatefulWidget {
  const ReadDataPage({super.key});

  @override
  State<ReadDataPage> createState() => _ReadDataPageState();
}

class _ReadDataPageState extends State<ReadDataPage> {
  late Future<Comment> futureComment;
  @override
  void initState() {
    super.initState();
    commentFuture = commentFuture;
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
              future: commentFuture,
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasData) {
                  final comments = snapshot.data!;
                  return buildcomments(comments);
                } else {
                  return const Text("No Data Available");
                }
              }),
        ),
      ),
    );
  }
}

Widget buildcomments(List<Comment> comments) {
  return ListView.builder(
      itemCount: comments.length,
      itemBuilder: (context, index) {
        final comment = comments[index];
        return InkWell(
          onTap: () {
            print(comment.id);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailReadDataPage(id: comment.id)));
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
                Expanded(flex: 3, child: Text(comment.name)),
                Expanded(flex: 3, child: Text(comment.email))
              ],
            ),
          ),
        );
      });
}
