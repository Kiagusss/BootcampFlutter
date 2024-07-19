import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pengayaan_12_go_route/pages/detail_listview.dart';
import 'package:pengayaan_12_go_route/pages/homescreen.dart';
import 'package:pengayaan_12_go_route/pages/list_view.dart';
import 'package:pengayaan_12_go_route/pages/login_page.dart';

class RouteNames {
  static const String homePage = '/';
  static const String loginPage = '/login';
  static const String listViewPage = '/listview';
  static const String detailListViewPage = '/detail';
}

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: RouteNames.homePage,
      name: RouteNames.homePage,
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: RouteNames.loginPage,
      name: RouteNames.loginPage,
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      path: RouteNames.listViewPage,
      name: RouteNames.listViewPage,
      builder: (context, state) => ListViewPage(),
    ),
    GoRoute(
      path: RouteNames.detailListViewPage,
      name: RouteNames.detailListViewPage,
      builder: (context, state) =>
          DetailListViewPage(index: state.extra as int),
    ),
  ],
);
