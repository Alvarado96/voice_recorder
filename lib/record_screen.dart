import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';

class RecordScreen extends StatefulWidget {
  const RecordScreen({super.key});

  @override
  State<RecordScreen> createState() => _RecordScreenState();
}

class _RecordScreenState extends State<RecordScreen> {
  final recorder = FlutterSoundRecorder();
  var isRecording = false;
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
    if (status != PermissionStatus.granted) {
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
                decoration: ShapeDecoration(
                    shape: const CircleBorder(),
                    color: isRecording
                        ? const Color.fromARGB(201, 244, 60, 51)
                        : const Color.fromARGB(202, 8, 147, 239)),
                child: IconButton(
                  icon: Icon(recorder.isRecording ? Icons.stop : Icons.mic),
                  onPressed: () async {
                    if (recorder.isRecording) {
                      await stop();
                    } else {
                      await record();
                    }
                    setState(() {
                      isRecording = !isRecording;
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
