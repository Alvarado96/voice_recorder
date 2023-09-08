import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:voice_recorder/record_screen.dart';
import 'package:voice_recorder/menu_scaffold.dart';
import 'package:voice_recorder/routes/app_routes.dart';
import 'package:voice_recorder/collections_screen.dart';

final router = GoRouter(routes: [
  GoRoute(
    path: '/',
    pageBuilder: (context, state) {
      return CustomTransitionPage(
        key: state.pageKey,
        child: MenuScaffold(routes: AppRoutes.routes, child: const RecordScreen(),),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          // Change the opacity of the screen using a Curve based on the the animation's
          // value
          return FadeTransition(
            opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
            child: child,
          );
        },
      );
    },
    //builder: (BuildContext context, GoRouterState state) => MenuScaffold(routes: AppRoutes.routes, child: const CollectionsScreen(),),
  ),
  GoRoute(
    path: '/${AppRoutes.record.name}',
    pageBuilder: (context, state) {
      return CustomTransitionPage(
        key: state.pageKey,
        child: MenuScaffold(routes: AppRoutes.routes, child: const RecordScreen(),),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          // Change the opacity of the screen using a Curve based on the the animation's
          // value
          return FadeTransition(
            opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
            child: child,
          );
        },
      );
    },
    //builder: (BuildContext context, GoRouterState state) => MenuScaffold(routes: AppRoutes.routes, child: const CollectionsScreen(),),
  ),
  GoRoute(
    path: '/${AppRoutes.collections.name}',
    pageBuilder: (context, state) {
      return CustomTransitionPage(
        key: state.pageKey,
        child: MenuScaffold(routes: AppRoutes.routes, child: const CollectionsScreen(),),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          // Change the opacity of the screen using a Curve based on the the animation's
          // value
          return FadeTransition(
            opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
            child: child,
          );
        },
      );
    },
    //builder: (BuildContext context, GoRouterState state) => MenuScaffold(routes: AppRoutes.routes, child: const CollectionsScreen(),),
  ),
]);
