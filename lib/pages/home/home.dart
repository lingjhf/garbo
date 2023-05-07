import 'package:flutter/material.dart';
import 'package:garbo/components/navigation_bar.dart';

class HomePage extends Page {
  const HomePage({super.key});

  @override
  Route createRoute(BuildContext context) {
    
    return MaterialPageRoute(
      settings: this,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(color: Colors.blue),
          child: NavigationBar(destinations: [
            TextButton(onPressed: () {}, child: const Text("ok",)),
            TextButton(onPressed: () {}, child: const Text("ok")),
            TextButton(onPressed: () {}, child: const Text("ok")),
          ]),
        );
      },
    );
  }
}
