import 'package:ai_chat_simple/api.dart';
import 'package:ai_chat_simple/chat_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatPageMobile extends StatefulWidget {
  final ChatInterfaceViewModel apiViewModel;

  ChatPageMobile({super.key, required this.apiViewModel});

  @override
  State<ChatPageMobile> createState() => _ChatPageMobileState();
}

class _ChatPageMobileState extends State<ChatPageMobile> {
  final _controller = TextEditingController();

  var currentMessage = 'This will contain chat gpt\'s message.';

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
            Expanded(
              child: Column(
                mainAxisAlignment: .center,
                crossAxisAlignment: .center,
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: .circular(20.0),
                    ),
                    child: Text(
                      currentMessage,
                      style: GoogleFonts.openSans(
                        fontSize: 20.0,
                        color: Colors.grey[200],
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
                    onPressed: () async {
                      if (_controller.text.trim().isEmpty) return;
                      final output = await widget.apiViewModel.send(
                        _controller.text.trim(),
                      );

                      print(currentMessage);

                      if (output.didSucceed == true) {
                        setState(() {
                          currentMessage = output.reply ?? '';
                        });
                      }

                      print(currentMessage);

                      if (output.didSucceed == false && context.mounted) {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          'start',
                          (_) => false,
                        );
                      }
                    },
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
