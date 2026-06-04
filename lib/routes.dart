import 'package:flutter/material.dart';

MaterialPageRoute generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case 'start':
      return MaterialPageRoute(
        builder: (_) => LayoutBuilder(
          builder: (context, constraints) =>
              constraints.maxWidth > 767 ? Placeholder() : Placeholder(),
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
