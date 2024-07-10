import 'package:go_router/go_router.dart';
import 'package:tugas_8_go_route/pages/detail_listview.dart';
import 'package:tugas_8_go_route/pages/homepage.dart';
import 'package:tugas_8_go_route/pages/listview.dart';
import 'package:tugas_8_go_route/pages/loginpage.dart';
import 'package:tugas_8_go_route/pages/splashpage.dart';
import '../model/user_model.dart';

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
      path: '/home/:username',
      builder: (context, state) {
        final username = state.pathParameters['username']!;
        return HomePage(username: username);
      },
    ),
    GoRoute(
      path: '/listview/:username',
      builder: (context, state) {
        final username = state.pathParameters['username']!;
        return ListViewPage(username: username);
      },
    ),
    GoRoute(
      path: '/detail/:username',
      builder: (context, state) {
        final user = state.extra as UserModel;
        final username = state.pathParameters['username']!;
        return DetailListViewPage(user: user, username: username);
      },
    ),
  ],
);
