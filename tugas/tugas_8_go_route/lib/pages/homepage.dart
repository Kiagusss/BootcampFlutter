import 'package:flutter/material.dart';
import 'package:tugas_8_go_route/pages/listview.dart';

class HomePage extends StatelessWidget {
  final String username;

  const HomePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome, $username'),
      ),
      body: ListViewPage(username: username),
    );
  }
}
