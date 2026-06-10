import 'package:ai_chat_simple/chat_view_model.dart';
import 'package:ai_chat_simple/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simply Chat',
      onGenerateRoute: (settings) => generateRoutes(settings),
      initialRoute: 'start',
    );
  }
}
