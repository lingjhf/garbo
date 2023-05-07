import 'package:flutter/material.dart';

class TaskPage extends Page {
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
