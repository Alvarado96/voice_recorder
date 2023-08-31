import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:voice_recorder/routes/app_routes.dart';

class MenuScaffold extends StatefulWidget {
  const MenuScaffold({super.key, required this.routes, required this.child, });

  final Widget child;
  final List<AppRoute> routes;
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MenuScaffoldState();
  }
}

class MenuScaffoldState extends State<MenuScaffold>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Voice Recorder"),
      ),
      bottomNavigationBar: _buildBottomAppBar(context),
      body: widget.child,
    );
  }

  Widget _buildBottomAppBar(context) {
    return SafeArea(
      child: BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,

        children: widget.routes
                .map((route) => GestureDetector(
                      key: Key('${route.name}-button'),
                      onTap: () => context.go('/${route.name}'),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: IconButton(
                              icon: Icon(route.icon),
                              onPressed: () => context.go('/${route.name}'),
                              iconSize: 25.0,
                            ),
                          ),
                          Flexible(
                            child: Text(route.name),
                          ),
                        ],
                      ),
                    ))
                .toList(),
        
      ),
    ));
  }
}