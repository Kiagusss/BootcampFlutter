import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../model/user_model.dart';

class DetailListViewPage extends StatelessWidget {
  final UserModel user;
  final String username;

  const DetailListViewPage(
      {super.key, required this.user, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail ListView Page'),
        leading: BackButton(
          onPressed: () {
            context.go('/home/$username');
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(user.avatar.toString()),
            ),
            const SizedBox(height: 20),
            Text(
              "${user.firstName} ${user.lastName}",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              "${user.email}",
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
