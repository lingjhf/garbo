import 'package:flutter/material.dart';
import 'package:garbo/components/icons.dart';
import 'package:garbo/components/navigation_bar.dart';
import 'package:garbo/pages/home/issues.dart';
import 'package:garbo/pages/home/notifications.dart';
import 'package:garbo/pages/home/projects.dart';
import 'package:garbo/theme.dart';

class HomePage extends Page {
  const HomePage({super.key});

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (context) {
        return const HomeContent();
      },
    );
  }
}

//首页内容
class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<StatefulWidget> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  List<Widget> components = [
    const NotificationList(),
    const ProjectList(),
    const IssuesList(),
  ];

  late Widget currentComponent;
  int selectedIndex = 0;

  @override
  void initState() {
    currentComponent = components[0];
    super.initState();
  }

  void onSelectedNav(int value) {
    setState(() {
      selectedIndex = value;
      currentComponent = components[value];
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).extension<GarboTheme>()!;
    return DefaultTextStyle(
      style: const TextStyle(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(color: theme.pageBackgroundColor),
              child: currentComponent,
            ),
          ),
          GNavigationBar(
            selectedIndex: selectedIndex,
            onSelected: onSelectedNav,
            backgroundColor: theme.navigationBarBackgroundColor,
            unselectedItemColor: theme.textColor,
            selectedItemColor: theme.textSelectedColor,
            itemOverlayColor: theme.textButtonOverlayColor,
            children: const [
              GNavigationItem(
                icon: Icons.notifications_outlined,
                label: Text("通知"),
              ),
              GNavigationItem(
                icon: GIcons.project,
                label: Text('项目'),
              ),
              GNavigationItem(
                icon: GIcons.issues,
                label: Text('问题'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
