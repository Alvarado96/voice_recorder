import 'package:flutter/material.dart';

class CollectionsScreen extends StatefulWidget {
  const CollectionsScreen({super.key});

  @override
  State<CollectionsScreen> createState() {
    return _CollectionsScreenState();
  }
}

class _CollectionsScreenState extends State<CollectionsScreen> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Text("Welcome to the Collections Screen!  Will add collections")
        ],
      ),
    );
  }
}