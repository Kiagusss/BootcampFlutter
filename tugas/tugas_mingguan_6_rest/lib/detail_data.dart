import 'package:flutter/material.dart';
import 'package:pengayaan_7_rest/model/comment_mode.dart';

import 'package:pengayaan_7_rest/services/comment_services.dart';

class DetailReadDataPage extends StatefulWidget {
  const DetailReadDataPage({super.key, this.id});
  final id;

  @override
  State<DetailReadDataPage> createState() => _DetailReadDataPageState();
}

class _DetailReadDataPageState extends State<DetailReadDataPage> {
  late Future<Comment> futureComment;

  @override
  void initState() {
    super.initState();
    futureComment = CommentServices.fetchComment(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Fetch Data Example"),
        ),
        body: Center(
          child: FutureBuilder<Comment>(
              future: futureComment,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data!.name);
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              }),
        ),
      ),
    );
  }
}
