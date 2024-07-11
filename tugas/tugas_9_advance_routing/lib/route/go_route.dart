import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tugas_9_advance_routing/main.dart';
import 'package:tugas_9_advance_routing/pages/detailchat.dart';
import 'package:tugas_9_advance_routing/pages/listchat.dart';
import 'package:tugas_9_advance_routing/pages/login_page.dart';
import 'package:tugas_9_advance_routing/pages/splash_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/listview',
      builder: (context, state) {
        return const ListChat();
      },
    ),
    GoRoute(
      path: '/main',
      builder: (context, state) {
        return const MainPage();
      },
    ),
    GoRoute(
      path: '/chat/:id',
      builder: (context, state) {
        final String id = state.pathParameters['id']!;
        return ChatDetailPage(id: int.parse(id));
      },
    ),
  ],
);
