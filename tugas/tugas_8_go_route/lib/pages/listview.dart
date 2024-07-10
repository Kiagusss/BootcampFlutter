import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/user_bloc.dart';
import '../model/user_model.dart';
import '../services/user_repository.dart';

class ListViewPage extends StatefulWidget {
  final String username;

  const ListViewPage({super.key, required this.username});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(UserRepository())..add(LoadUserEvent()),
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is UserErrorState) {
            return const Center(
              child: Text("Error"),
            );
          }
          if (state is UserLoadedState) {
            List<UserModel> userList = state.users;
            return ListView.builder(
              itemCount: userList.length,
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 8,
                  ),
                  child: Card(
                    color: Theme.of(context).primaryColor,
                    child: ListTile(
                      title: Text(
                        "${userList[index].firstName} ${userList[index].lastName}",
                        style: const TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        "${userList[index].email}",
                        style: const TextStyle(color: Colors.white),
                      ),
                      leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage(userList[index].avatar.toString()),
                      ),
                      onTap: () {
                        context.go('/detail/${widget.username}',
                            extra: userList[index]);
                      },
                    ),
                  ),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
