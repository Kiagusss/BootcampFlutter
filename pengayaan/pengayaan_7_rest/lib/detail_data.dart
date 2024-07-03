import 'package:flutter/material.dart';
import 'package:pengayaan_7_rest/model/album_model.dart';
import 'package:pengayaan_7_rest/services/materi_services.dart';

class DetailReadDataPage extends StatefulWidget {
  const DetailReadDataPage({super.key, this.id});
  final id;
  @override
  State<DetailReadDataPage> createState() => _DetailReadDataPageState();
}

class _DetailReadDataPageState extends State<DetailReadDataPage> {
  late Future<Album> futureAlbum = MateriServices.fetchAlbum(widget.id);

  @override
  void initState() {
    super.initState();
    futureAlbum = futureAlbum;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("fetch data example"),
        ),
        body: Center(
          child: FutureBuilder<Album>(
              future: futureAlbum,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data!.title);
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
