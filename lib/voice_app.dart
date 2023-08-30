import 'package:flutter/material.dart';
import 'package:voice_recorder/routes/routes.dart';

class VoiceApp extends StatefulWidget {
  const VoiceApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _VoiceAppState();
  }
}

class _VoiceAppState extends State<VoiceApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Voice Recorder",
      routerConfig: router,
    );
  }
}
