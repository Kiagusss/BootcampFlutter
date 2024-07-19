import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../routers.dart';

class ListViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ListView Page')),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Item $index'),
            onTap: () => context.pushNamed(RouteNames.detailListViewPage, extra: index),
          );
        },
      ),
    );
  }
}
