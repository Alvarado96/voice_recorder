import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';

class RecordScreen extends StatefulWidget {
  const RecordScreen({super.key});

  @override
  State<RecordScreen> createState() => _RecordScreenState();
}

class _RecordScreenState extends State<RecordScreen> {
  final recorder = FlutterSoundRecorder();
  bool isRecorderReady = false;
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
    isRecorderReady = true;
    recorder.setSubscriptionDuration(const Duration(milliseconds: 500));
  }

  Future record() async {
    if (!isRecorderReady) return;
    await recorder.startRecorder(toFile: 'audio');
  }

  Future stop() async {
    if (!isRecorderReady) return;

    final path = await recorder.stopRecorder();
    final audioFile = File(path!);

    print('Recorded audio: $audioFile');
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
              StreamBuilder<RecordingDisposition>(
                stream: recorder.onProgress,
                builder: (context, snapshot) {
                  final duration = snapshot.hasData
                      ? snapshot.data!.duration
                      : Duration.zero;
                  
                  String twoDigits(int n) => n.toString().padLeft(2, '0');
                  final twoDigitMinutes = 
                      twoDigits(duration.inMinutes.remainder(60));
                  final twoDigitSeconds =
                    twoDigits(duration.inSeconds.remainder(60));

                  return Text(
                    '$twoDigitMinutes:$twoDigitSeconds',
                    style: const TextStyle(
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                  // return Text(
                  //   '${duration.inSeconds} s',
                  //   style: const TextStyle(
                  //       fontSize: 80, fontWeight: FontWeight.bold),
                  // );
                },
              ),
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
