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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        bottomAppBarTheme: const BottomAppBarTheme(color: Color.fromRGBO(96, 125, 139, 1)),
        canvasColor: const Color.fromARGB(218, 218, 227, 251),
        textTheme: GoogleFonts.robotoTextTheme(),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blueGrey, 
        )
      ),
      title: "Voice Recorder",
      routerConfig: router,
    );
  }
}
