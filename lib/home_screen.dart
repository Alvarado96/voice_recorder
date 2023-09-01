import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final recorder = FlutterSoundRecorder();
  @override
  Widget build(context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: double.infinity,
          
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Ink(
                  decoration: const ShapeDecoration(shape: CircleBorder(),
                  color:  Color.fromARGB(203, 221, 247, 222)),
                  child: IconButton(
                    icon: Icon(recorder.isRecording ? Icons.stop : Icons.mic),
                    onPressed: () {
                
                    },
                    iconSize: 100,
                  ),
                )
              ],
            ),
          
        ),
      ),
      
    );
  }
}
