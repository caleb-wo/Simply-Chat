import 'package:ai_chat_simple/mobile/start.dart';
import 'package:flutter/material.dart';

MaterialPageRoute generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case 'start':
      return MaterialPageRoute(
        builder: (_) => LayoutBuilder(
          builder: (context, constraints) =>
              constraints.maxWidth > 767 ? Placeholder() : StartPageMobile(),
        ),
      );
    case '/':
      return MaterialPageRoute(
        builder: (_) => LayoutBuilder(
          builder: (context, constraints) =>
              constraints.maxWidth > 767 ? Placeholder() : Placeholder(),
        ),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => LayoutBuilder(
          builder: (context, constraints) =>
              constraints.maxWidth > 767 ? Placeholder() : Placeholder(),
        ),
      );
  }
}
