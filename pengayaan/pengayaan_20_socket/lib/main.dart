import 'package:flutter/material.dart';
import 'package:pengayaan_20_socket/socket_page.dart';
import 'package:pengayaan_20_socket/socket_server.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await NotificationHelper().initLocalNotifications();
  AppSocketServer().initialize();
  runApp(MaterialApp(home: MateriSocketIO()));
}
