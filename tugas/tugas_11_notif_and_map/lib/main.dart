import 'dart:convert';
import 'dart:math';
import 'package:easy_scaffold/easy_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:tugas_11_notif_and_map/map.dart';
import 'package:tugas_11_notif_and_map/notification_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationHelper().initLocalNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Scaffold(body: Home()));
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () async {
                NotificationHelper.payload.value = "";
                await NotificationHelper.flutterLocalNotificationsPlugin.show(
                    Random().nextInt(99),
                    "Notification Title",
                    "Ini adalah isi notifikasi eaaa",
                    payload: jsonEncode({"data": "test"}),
                    NotificationHelper.notificationDetails);
              },
              child: const Text("Button Notification")),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            width: 200,
            child: Text(
              "Izinkan Aplikasi untuk lokasi, dikarenakan menggunakan lokasi terkini anda ketika membuka page map",
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                openPage(
                    const MyMap(
                      locations: [
                        LatLng(37.7749, -122.4194),
                        LatLng(37.7749, -122.4194),
                      ],
                    ),
                    context);
              },
              child: const Text("To Map Page"))
        ],
      ),
    );
  }
}
