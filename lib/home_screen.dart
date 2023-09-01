import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final recorder = FlutterSoundRecorder();

  @override
  void initState() {
    super.initState();
    initRecorder();
  }

  @override
  void dispose() {
    recorder.closeRecorder();
    super.dispose();
  }

  Future initRecorder() async {

    final status = await Permission.microphone.request();
    if(status != PermissionStatus.granted) {
      //openAppSettings();
      throw "Microphone permission not granted";
    }
    await recorder.openRecorder();

  }

  Future record() async {
    await recorder.startRecorder(toFile: 'audio');
  }

  Future stop() async {
    await recorder.stopRecorder();
  }

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
                    onPressed: () async {
                      if(recorder.isRecording) {
                        await stop();
                      } else {
                        await record();
                      }
                      setState(() {
                        
                      });
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
