import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await NotificationHelper().initLocalNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListenableBuilder(
                    listenable: NotificationHelper.payload,
                    builder: (context, child) {
                      return Text(
                        "Local Notification Payload :\n\n${NotificationHelper.payload.value}\n",
                        textAlign: TextAlign.center,
                      );
                    }),
                ElevatedButton(
                    onPressed: () async {
                      NotificationHelper.payload.value = "";
                      await NotificationHelper.flutterLocalNotificationsPlugin
                          .show(
                              Random().nextInt(99),
                              "Judul Notifikasi",
                              "Percobaan Notifikasi",
                              payload: jsonEncode({"data": "test"}),
                              NotificationHelper.notificationDetails);
                    },
                    child: const Text("Press me"))
              ],
            ),
          ),
        ));
  }
}

class NotificationHelper {
  /// Flutter Local Notification Plugin
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  /// Notification Payload
  static ValueNotifier<String> payload = ValueNotifier("");

  /// Set the payload
  void setPayload(String newPayload) {
    payload.value = newPayload;
  }

  /// Inisialisasikan Settingan Channel Notifikasi untuk Android.
  static AndroidNotificationDetails androidNotificationDetails =
      const AndroidNotificationDetails(
    'Local Notif',
    'Sanber Local Notif',
    channelDescription: 'Untuk percobaan Local Notif',
    importance: Importance.max,
    priority: Priority.high,
    icon: '@mipmap/ic_launcher',
    playSound: true,
    enableVibration: true,
  );

  /// Inisialisasikan Setting Channel Notifikasi untuk iOS/MacOS
  static DarwinNotificationDetails iOSNotificationDetails =
      const DarwinNotificationDetails(
    threadIdentifier: 'local_notif',
    presentAlert: true,
    presentBadge: true,
    presentSound: true,
  );

  /// Notifications Details untuk multi platform
  static NotificationDetails notificationDetails = NotificationDetails(
    android: androidNotificationDetails,
    iOS: iOSNotificationDetails,
  );

  /// Inisialisasi flutter_local_notifications
  Future<void> initLocalNotifications() async {
    /// Config for Android
    const initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    /// Config for iOS & MacOS
    const initializationSettingsIOS = DarwinInitializationSettings();

    /// Initializations
    const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    /// Inisialisasikan Konfigurasi dari Local Notification.
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {
        /// Handle ketika notifikasi ditekan.
        debugPrint("Notifikasi Ditekan ${details.payload}");
        setPayload(details.payload ?? '');
      },
    );

    /// Request Permission untuk Android 13 ke atas.
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();

    /// Request Permission untuk iOS
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }
}
