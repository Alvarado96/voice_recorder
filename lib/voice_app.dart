import 'package:flutter/material.dart';
import 'package:voice_recorder/routes/routes.dart';
import 'package:google_fonts/google_fonts.dart';

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
      theme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blueGrey
          
        )
      ),
      title: "Voice Recorder",
      routerConfig: router,
    );
  }
}
