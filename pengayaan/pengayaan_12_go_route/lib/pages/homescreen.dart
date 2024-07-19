import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../routers.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.pushNamed(RouteNames.loginPage),
              child: Text('Go to Login Page'),
            ),
            ElevatedButton(
              onPressed: () => context.pushNamed(RouteNames.listViewPage),
              child: Text('Go to ListView Page'),
            ),
          ],
        ),
      ),
    );
  }
}
