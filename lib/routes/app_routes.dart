
import 'package:flutter/material.dart';

class AppRoute {
  final String name;
  final IconData icon;
  const AppRoute({required this.name, required this.icon});
}

class AppRoutes {
  static AppRoute category = const AppRoute(name: "category", icon: Icons.category);
  static AppRoute record = const AppRoute(name: "record", icon: Icons.circle);
  static AppRoute favorites = const AppRoute(name: "favorites", icon: Icons.favorite);

  static List<AppRoute> routes = [category, record, favorites];
}