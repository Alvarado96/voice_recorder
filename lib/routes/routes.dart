import 'package:go_router/go_router.dart';
import 'package:voice_recorder/home_screen.dart';
import 'package:voice_recorder/menu_scaffold.dart';
import 'package:voice_recorder/routes/app_routes.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => MenuScaffold(routes: AppRoutes.routes, child: const HomeScreen(),),
    ),
  ]);