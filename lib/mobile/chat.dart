import 'package:ai_chat_simple/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatPageMobile extends StatefulWidget {
  final ApiManager _manager;

  ChatPageMobile({super.key, required this._manager});

  @override
  State<ChatPageMobile> createState() => _ChatPageMobileState();
}

class _ChatPageMobileState extends State<ChatPageMobile> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.center,
          radius: 1.2,
          colors: [
            Color(0xFF455A64),
            Color(0xFF263238),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Flex(
          direction: .vertical,
          children: [
            Expanded(child: /*OpenAiChatReader(_manager)*/ Placeholder()),
            Container(
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  TextField(
                    controller: _controller,
                    textAlign: .left,
                    cursorColor: Colors.blueGrey,
                    maxLines: 8,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusColor: Colors.black,
                      hintText: 'My message to Chat GPT...',
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 16.0,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 14.0,
                      ),
                    ),
                    style: GoogleFonts.dmSans(
                      color: Colors.blueGrey[900],
                      fontSize: 18.0,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => throw UnimplementedError(),
                    style: ButtonStyle(backgroundColor: .all(Colors.blueGrey)),
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
