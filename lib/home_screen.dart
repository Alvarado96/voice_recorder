import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 2, 31, 70),
        title: const Text(
          "Voice Recorder",
          textAlign: TextAlign.center,
          style: TextStyle(color: Color.fromARGB(255, 179, 201, 213)),
        ),
      ),
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
              children: [
                Icon(
                  Icons.mic,
                  size: 100,
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: const Color.fromARGB(255, 2, 31, 70),
        child: IconTheme(
            data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              tooltip: 'Home',
              icon: const Icon(Icons.home_filled),
              onPressed: () {},
            ),
            IconButton(
              tooltip: 'Record',
              icon: const Icon(Icons.circle),
              onPressed: () {},
            ),
            IconButton(
              tooltip: 'Favorites',
              icon: const Icon(Icons.favorite),
              onPressed: () {},
            )]),
      ),
      )
    );
  }
}
