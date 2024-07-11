import 'package:flutter/material.dart';

import 'package:easy_scaffold/easy_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tugas_9_advance_routing/route/go_route.dart';
import 'package:tugas_9_advance_routing/services/post_repository.dart';

import 'bloc/bloc/navigation_bloc/navigation_bloc.dart';
import 'bloc/bloc/post_bloc.dart';
import 'pages/call.dart';
import 'pages/contacts.dart';
import 'pages/listchat.dart';
import 'pages/settings.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<PostBloc>(
          create: (context) => PostBloc(PostRepository()),
        ),
        BlocProvider(create: (context) => DrawerCubit()),
        BlocProvider(create: (context) => BottomNavCubit()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        title: 'Flutter Demo',
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  static final List<Widget> _pages = <Widget>[
    const ContactPage(),
    const CallPage(),
    const ListChat(),
    const SettingPage(),
  ];

  void _onItemTapped(int index) {
    context.read<BottomNavCubit>().updateIndex(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BottomNavCubit, int>(
        builder: (context, state) {
          return _pages[state];
        },
      ),
      bottomNavigationBar: BlocBuilder<BottomNavCubit, int>(
        builder: (context, state) {
          return BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.people_outline, size: 30),
                label: 'Contacts',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.call, size: 30),
                label: 'Call',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble_outline_sharp, size: 30),
                label: 'Chat',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings, size: 30),
                label: 'Settings',
              ),
            ],
            currentIndex: state,
            selectedItemColor: const Color(0xff2AABEE),
            unselectedItemColor: Colors.black,
            backgroundColor: Colors.blue,
            selectedLabelStyle: const TextStyle(color: Colors.black),
            unselectedLabelStyle: const TextStyle(color: Colors.black),
            onTap: _onItemTapped,
            showUnselectedLabels: true,
          );
        },
      ),
    );
  }
}
