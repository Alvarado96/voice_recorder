import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(context) {
    return const Scaffold(
      body: Center(
        child: SizedBox(
          width: double.infinity,
          
            child: Column(
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
      
    );
  }
}
