import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: double.infinity,
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 93, 159, 234),
                Color.fromARGB(255, 32, 116, 211),
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(Icons.mic, size: 100,)],
            ),
          ),
        ),
      ),
    );
  }
}
