import 'package:flutter/material.dart';

class DetailListViewPage extends StatelessWidget {
  final int index;

  const DetailListViewPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail ListView Page')),
      body: Center(
        child: Text('Detail of Item $index'),
      ),
    );
  }
}
