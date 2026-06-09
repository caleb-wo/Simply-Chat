import 'package:ai_chat_simple/api.dart';
import 'package:ai_chat_simple/mobile/chat.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartPageMobile extends StatefulWidget {
  StartPageMobile();

  @override
  State<StartPageMobile> createState() => _StartPageMobileState();
}

class _StartPageMobileState extends State<StartPageMobile> {
  final _controller = TextEditingController();
  late final ApiManager manager;

  ApiManager _initializeChatPage(String apiText) {
    final key = apiText.trim();
    return ApiManager(key);
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

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
        body: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: [
            Flex(
              direction: .horizontal,
              children: [
                Spacer(),
                Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: .center,
                        children: [
                          Tooltip(
                            triggerMode: .tap,
                            preferBelow: false,
                            margin: .symmetric(horizontal: deviceWidth / 3),
                            textAlign: .center,
                            padding: const .all(10.0),
                            decoration: BoxDecoration(
                              color: Colors.blueGrey[900],
                              borderRadius: .only(
                                topLeft: Radius.circular(20.0),
                                topRight: .circular(20.0),
                                bottomRight: .circular(20.0),
                              ),
                            ),
                            richMessage: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Your key will not be saved anywhere.',
                                ),
                                TextSpan(
                                  text:
                                      " It's completly erased once this app is closed.",
                                ),
                              ],
                              style: GoogleFonts.openSans(color: Colors.white),
                            ),
                            child: Icon(
                              Icons.help_outline_outlined,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            'OpenAI API Key:',
                            style: GoogleFonts.openSans(
                              fontSize: 20.0,
                              fontWeight: .bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: .circular(
                            20.0,
                          ),
                        ),
                        child: Padding(
                          padding: const .all(
                            8.0,
                          ),
                          child: TextField(
                            controller: _controller,
                            maxLines: 1,
                            textAlign: .center,
                            cursorColor: Colors.blueGrey,
                            onSubmitted: (_) {
                              if (_controller.text.trim().isEmpty) {
                                FocusScope.of(context).unfocus();
                                _controller.clear();
                                return;
                              }
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChatPageMobile(
                                    manager: _initializeChatPage(
                                      _controller.text,
                                    ),
                                  ),
                                ),
                                (_) => false,
                              );
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              focusColor: Colors.black,
                              hintText: 'Paste sk-... key here',
                              hintStyle: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 16.0,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 14.0,
                              ),
                            ),
                            style: GoogleFonts.dmSans(
                              color: Colors.blueGrey[900],
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          if (_controller.text.trim().isEmpty) {
                            FocusScope.of(context).unfocus();
                            _controller.clear();
                            return;
                          }
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChatPageMobile(
                                manager: _initializeChatPage(_controller.text),
                              ),
                            ),
                            (_) => false,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.blueGrey, // Arrow color
                          shape: CircleBorder(), // Clean circle button
                          padding: EdgeInsets.all(20),
                          elevation: 4, // Gives it a modern drop shadow
                        ),
                        child: Icon(Icons.arrow_forward_rounded, size: 30),
                      ),
                    ],
                  ),
                ),
                Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
