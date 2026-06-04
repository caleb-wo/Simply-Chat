import 'package:ai_chat_simple/routes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  Future<SharedPreferences> get _prefs async =>
      await SharedPreferences.getInstance();

  Future<bool?> get hasKey async {
    try {
      final prefs = await _prefs;
      return prefs.getBool('hasKey');
    } catch (e) {
      debugPrint("[ERROR] Issues with shared preferences.\n$e");
      return null;
    }
  }

  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool?>(
      future: hasKey,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(
            home: Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ),
          );
        }

        final bool? keyStatus = snapshot.data;
        final String computedInitialRoute =
            (keyStatus == null || keyStatus == false) ? 'start' : '/';

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Simply Chat',
          onGenerateRoute: (settings) => generateRoutes(settings),
          initialRoute: computedInitialRoute,
        );
      },
    );
  }
}
