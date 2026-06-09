import 'package:ai_chat_simple/api.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatPageMobile extends StatefulWidget {
  final ApiManager _manager;

  ChatPageMobile({super.key, required this._manager});

  @override
  State<ChatPageMobile> createState() => _ChatPageMobileState();
}

class _ChatPageMobileState extends State<ChatPageMobile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.center,
          radius: 1.2,
          colors: [
            Color(0xFF455A64), // Lighter blue-grey in the center
            Color(0xFF263238), // Deeper blue-grey at the edges
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text(
            'Simply Chat',
            style: GoogleFonts.lalezar(
              fontSize: 50.0,
              letterSpacing: 2.0,
              color: Colors.white,
            ),
          ),
        ),
        body: Center(
          child: DecoratedBox(
            decoration: BoxDecoration(color: Colors.green),
            child: SizedBox(
              width: 300.0,
              height: 400.0,
            ),
          ),
        ),
      ),
    );
  }
}
