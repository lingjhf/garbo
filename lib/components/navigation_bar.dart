import 'package:flutter/material.dart';

class GNavigationBar extends StatelessWidget {
  const GNavigationBar({
    super.key,
    this.selectedIndex = 0,
    this.children = const [],
  });

  final int selectedIndex;
  final List<GNavigationItem> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          for (int i = 0; i < children.length; i++)
            GNavigationItemProvider(index: i, child: children[i])
        ],
      ),
    );
  }
}

class GNavigationItem extends StatefulWidget {
  const GNavigationItem({super.key});

  @override
  State<StatefulWidget> createState() => _GNavigationItemState();
}

class _GNavigationItemState extends State<GNavigationItem> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class GNavigationItemProvider extends InheritedWidget {
  const GNavigationItemProvider({
    super.key,
    required this.index,
    required super.child,
    this.onSelected,
  });
  final int index;
  final ValueChanged<int>? onSelected;

  @override
  bool updateShouldNotify(covariant GNavigationItemProvider oldWidget) =>
      index != oldWidget.index;
}
