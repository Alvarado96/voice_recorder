import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

String completePath = "";
String directoryPath = "";

class RecordScreen extends StatefulWidget {
  const RecordScreen({super.key});

  @override
  State<RecordScreen> createState() => _RecordScreenState();
}

class _RecordScreenState extends State<RecordScreen> {
  String currentFileName = "";
  final recorder = FlutterSoundRecorder();
  bool isRecorderReady = false;
  var isRecording = false;
  @override
  void initState() {
    super.initState();
    //currentFileName = _fileName(); //you dont want to call this here cuz it creates an empty file
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
    final statusStorage = await Permission.storage.status;
    if (!statusStorage.isGranted) {
      await Permission.storage.request();
    }
    await recorder.openRecorder();
    directoryPath = await _directoryPath();
    completePath = await _completePath(directoryPath);
    _createDirectory();
    //_createFile();
    isRecorderReady = true;
    recorder.setSubscriptionDuration(const Duration(milliseconds: 500));
  }

  Future record() async {
    if (!isRecorderReady) return;
    currentFileName = _fileName();
    completePath = await _completePath(directoryPath);
    setState(() {}); // Trigger a rebuild to update the displayed filename
    print("Path where the file will be : $completePath");
    await recorder.startRecorder(toFile: completePath);
  }

  Future stop() async {
    if (!isRecorderReady) return;

    final path = await recorder.stopRecorder();
    final audioFile = File(completePath);

    print('Recorded audio: $audioFile');
  }

  Future<String> _completePath(String directory) async {
    return "$directory$currentFileName";
  }

  Future<String> _directoryPath() async {
    //var directory = await getExternalStorageDirectory();
    //var directory = Directory("/storage/emulated/0/Download");
    var directory = Directory("/storage/emulated/0/Download");

    var directoryPath = directory.path;
    return "$directoryPath/audio/";
  }

  Future _createDirectory() async {
    bool isDirectoryCreated = await Directory(directoryPath).exists();
    if (!isDirectoryCreated) {
      Directory(directoryPath).create().then((Directory directory) {
        print("DIRECTORY CREATED at : " + directory.path);
      });
    }
  }

  // Future _createFile() async {
  //   File(completePath).create(recursive: true).then((File file) async {
  //     Uint8List bytes = await file.readAsBytes();
  //     file.writeAsBytes(bytes);
  //     print("FILE CREATED AT : " + file.path);
  //   });
  // }

  String _fileName() {
    final now = DateTime.now();
    final formattedDate =
        "${now.year}${_twoDigits(now.month)}${_twoDigits(now.day)}_${_twoDigits(now.hour)}${_twoDigits(now.minute)}${_twoDigits(now.second)}";
    return "record_$formattedDate.wav";
  }

  String _twoDigits(int n) {
    if (n >= 10) {
      return "$n";
    }
    return "0$n";
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
