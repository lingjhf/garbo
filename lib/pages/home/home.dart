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

  @override
  void initState() {
    currentComponent = components[0];
    super.initState();
  }

  void onSelectedNav(int value) {
    setState(() {
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
          SizedBox(
            height: 40,
            child: GNavigationBar(
              onSelected: onSelectedNav,
              color: theme.navigationBarBackgroundColor,
              children: [
                GNavigationItem(
                  child: Row(
                    children: const [
                      Icon(Icons.notifications_outlined),
                      Text("通知")
                    ],
                  ),
                ),
                GNavigationItem(
                  child: Row(
                    children: const [Icon(GIcons.project), Text('项目')],
                  ),
                ),
                GNavigationItem(
                  child: Row(
                    children: const [Icon(GIcons.issues), Text('问题')],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
