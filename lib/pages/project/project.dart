import 'package:flutter/material.dart';

class ProjectPage extends Page {
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
