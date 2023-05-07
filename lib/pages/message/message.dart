import 'package:flutter/material.dart';

class MessagePage extends Page {
  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (context) {
        return Container();
      },
    );
  }
}
