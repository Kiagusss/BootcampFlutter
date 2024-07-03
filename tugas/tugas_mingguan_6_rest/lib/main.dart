import 'package:flutter/material.dart';

import 'package:easy_scaffold/easy_scaffold.dart';
import 'package:pengayaan_7_rest/pages/call.dart';
import 'package:pengayaan_7_rest/pages/contacts.dart';
import 'package:pengayaan_7_rest/pages/listchat.dart';
import 'package:pengayaan_7_rest/pages/settings.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    const ContactPage(),
    const CallPage(),
    const ListChat(),
    const SettingPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              size: 30,
              Icons.people_outline,
            ),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.call,
              size: 30,
            ),
            label: 'Call',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat_bubble_outline_sharp,
              size: 30,
            ),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              size: 30,
            ),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xff2AABEE),
        unselectedItemColor: Colors.black,
        backgroundColor: Colors.blue,
        selectedLabelStyle: const TextStyle(color: Colors.black),
        unselectedLabelStyle: const TextStyle(color: Colors.black),
        onTap: _onItemTapped,
        showUnselectedLabels: true,
      ),
    );
  }
}
