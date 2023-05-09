import 'package:flutter/material.dart';

class GNavigationBar extends StatelessWidget {
  const GNavigationBar({
    super.key,
    this.selectedIndex = 0,
    this.children = const [],
    this.color,
    this.onSelected,
  });

  final int selectedIndex;
  final List<GNavigationItem> children;
  final Color? color;
  final ValueChanged<int>? onSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: color),
      child: Row(
        children: [
          for (int i = 0; i < children.length; i++)
            GNavigationItemProvider(
              index: i,
              onSelected: onSelected,
              child: children[i],
            )
        ],
      ),
    );
  }
}

class GNavigationItem extends StatefulWidget {
  const GNavigationItem({super.key, required this.child});

  final Widget child;

  @override
  State<StatefulWidget> createState() => _GNavigationItemState();
}

class _GNavigationItemState extends State<GNavigationItem> {
  void onSelected(BuildContext context) {
    var provider = GNavigationItemProvider.of(context);
    provider?.onSelected?.call(provider.index);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: () => onSelected(context),
        child: widget.child,
      ),
    );
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

  static GNavigationItemProvider? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<GNavigationItemProvider>();
  }

  @override
  bool updateShouldNotify(covariant GNavigationItemProvider oldWidget) =>
      index != oldWidget.index;
}
