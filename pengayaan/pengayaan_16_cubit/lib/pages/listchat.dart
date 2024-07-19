import 'package:easy_scaffold/easy_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pengayaan_16_cubit/pages/detailchat.dart';

import '../bloc/bloc/navigation_bloc/navigation_bloc.dart';
import '../bloc/bloc/post_bloc.dart';

class ListChat extends StatefulWidget {
  const ListChat({super.key});

  @override
  _ListChatState createState() => _ListChatState();
}

class _ListChatState extends State<ListChat> {
  @override
  void initState() {
    super.initState();
    context.read<PostBloc>().add(LoadPostEvent());
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
          title: Row(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 20.0,
                    backgroundColor: Colors.blue[200],
                    child: ClipOval(
                      child: Image.network(
                        "https://images.pexels.com/photos/1001682/pexels-photo-1001682.jpeg?auto=compress&cs=tinysrgb&w=600",
                        width: 30.0,
                        height: 30.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 25),
                    child: CircleAvatar(
                      radius: 20.0,
                      backgroundColor: Colors.blue[200],
                      child: ClipOval(
                        child: Image.network(
                          "https://images.pexels.com/photos/1001682/pexels-photo-1001682.jpeg?auto=compress&cs=tinysrgb&w=600",
                          width: 30.0,
                          height: 30.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 50),
                    child: CircleAvatar(
                      radius: 20.0,
                      backgroundColor: Colors.blue[200],
                      child: ClipOval(
                        child: Image.network(
                          "https://images.pexels.com/photos/1001682/pexels-photo-1001682.jpeg?auto=compress&cs=tinysrgb&w=600",
                          width: 30.0,
                          height: 30.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              const Text(
                "Chats",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
          actions: const [
            Icon(
              Icons.add_circle_outline_outlined,
              size: 30,
            ),
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.search,
              size: 30,
            ),
            SizedBox(
              width: 15,
            ),
          ],
          bottom: TabBar(
            indicatorColor: const Color(0xff2AABEE),
            isScrollable: true,
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.black,
            tabs: [
              Tab(
                child: Row(
                  children: [
                    const Text(
                      "All Chats",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Roboto",
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      decoration: const BoxDecoration(
                        color: Color(0xff2AABEE),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: const Text(
                        "16",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Tab(
                child: Row(
                  children: [
                    const Text(
                      "News",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Roboto",
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      decoration: const BoxDecoration(
                        color: Color(0xffe2f5fd),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: const Text(
                        "16",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Tab(text: 'Design'),
              const Tab(text: 'Midjournal'),
            ],
          ),
        ),
        drawer: BlocBuilder<DrawerCubit, int>(
          builder: (context, state) {
            return Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  SizedBox(
                    height: 190,
                    child: DrawerHeader(
                        decoration: const BoxDecoration(
                          color: Color(0xff24A1DE),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.blue.shade500,
                              radius: 30,
                              child: const CustomText(
                                text: "KA",
                                fontSize: 30,
                                fontWeight: FontWeight.w800,
                                fontFamily: "Roboto",
                                color: Colors.white,
                              ),
                            ),
                            const CustomText(
                              text: "Kiagus Ahmad Farhan Aziz",
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              fontFamily: "Roboto",
                              color: Colors.white,
                            ),
                            const CustomText(
                              text: "+62 827 87423132",
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                              fontFamily: "Roboto",
                              color: Colors.white,
                            ),
                          ],
                        )),
                  ),
                  ListTile(
                    leading: const Icon(Icons.person, size: 30),
                    title: const Text('Profile'),
                    selected: state == 0,
                    onTap: () {
                      print(state);
                      context.read<DrawerCubit>().selectItem(0);
                      Navigator.pop(context);
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.call, size: 30),
                    title: const Text('Calls'),
                    selected: state == 1,
                    onTap: () {
                      print(state);
                      context.read<DrawerCubit>().selectItem(1);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.map_outlined,
                      size: 30,
                    ),
                    title: const CustomText(
                      text: 'People Nearby',
                      fontWeight: FontWeight.w600,
                    ),
                    selected: state == 2,
                    onTap: () {
                      print(state);
                      context.read<DrawerCubit>().selectItem(2);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.bookmark_border_outlined,
                      size: 30,
                    ),
                    selected: state == 3,
                    title: const CustomText(
                      text: 'Saved Messages',
                      fontWeight: FontWeight.w600,
                    ),
                    onTap: () {
                      print(state);
                      context.read<DrawerCubit>().selectItem(3);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.settings,
                      size: 30,
                    ),
                    selected: state == 4,
                    title: const CustomText(
                      text: 'Settings',
                      fontWeight: FontWeight.w600,
                    ),
                    onTap: () {
                      print(state);
                      context.read<DrawerCubit>().selectItem(4);
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            );
          },
        ),
        body: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            if (state is PostLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is PostLoadedState) {
              return ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (context, index) {
                  final post = state.posts[index];
                  final List<bool> boolean = [
                    true,
                    true,
                    true,
                    true,
                    true,
                    false,
                    true,
                    false,
                    true,
                    false,
                  ];
                  final comment = [index];
                  bool noted = false;
                  bool chated = false;
                  bool readed = false;
                  if (index == 0 || index == 1) {
                    noted = boolean[index];
                  }
                  if (index == 2 || index == 3 || index == 5) {
                    chated = boolean[index];
                  }
                  if (index == 4 || index == 8 || index == 6 || index == 7) {
                    readed = boolean[index];
                  }
                  return InkWell(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => ChatDetailPage(
                        //               id: postList[index].id,
                        //             )));
                      },
                      child: _chatWidget(
                        post.title,
                        null,
                        SizedBox(
                          width: 150,
                          child: CustomText(
                              text: post.body,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis),
                        ),
                        noted: noted,
                        haveChat: chated,
                        readed: readed,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChatDetailPage(
                                id: post.id,
                              ),
                            ),
                          );
                        },
                      ));
                },
              );
            } else if (state is PostErrorState) {
              return Center(
                child: Text("Error: ${state.error}"),
              );
            }
            return const Center(
              child: Text("No Data"),
            );
          },
        ),
      ),
    );
  }
}

Widget _chatWidget(String? name, String? image, Widget? chat,
    {bool noted = false,
    bool haveChat = false,
    bool readed = false,
    required VoidCallback onTap}) {
  Widget? trailingIcon;

  if (noted) {
    trailingIcon = const Icon(Icons.location_on);
    haveChat = false;
    readed = false;
  } else if (haveChat) {
    trailingIcon = const CircleAvatar(
      radius: 15,
      backgroundColor: Color(0xff2AABEE),
      child: CustomText(
        text: "2",
        color: Colors.white,
        fontWeight: FontWeight.w700,
      ),
    );
    noted = false;
    readed = false;
  } else if (readed) {
    trailingIcon = const Icon(Icons.check);
    noted = false;
    haveChat = false;
  } else {
    trailingIcon = null;
  }

  return InkWell(
    onTap: onTap,
    child: SizedBox(
      height: 75,
      child: Center(
        child: ListTile(
          tileColor: noted ? const Color(0xffE2F5FD) : Colors.white,
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(image ??
                "https://images.pexels.com/photos/837358/pexels-photo-837358.jpeg?auto=compress&cs=tinysrgb&w=600"),
          ),
          title: Container(
              child: CustomText(
            text: name ?? "Kiagus",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          )),
          subtitle: chat ?? Container(),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const CustomText(text: "4:30 PM"),
              if (trailingIcon != null) trailingIcon,
            ],
          ),
        ),
      ),
    ),
  );
}
