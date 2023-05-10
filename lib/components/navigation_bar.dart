import 'package:flutter/material.dart';

class GNavigationBar extends StatelessWidget {
  const GNavigationBar({
    super.key,
    this.selectedIndex = 0,
    this.children = const [],
    this.height = 40,
    this.backgroundColor,
    this.selectedItemColor,
    this.unselectedItemColor,
    this.itemOverlayColor,
    this.onSelected,
  });

  final int selectedIndex;
  final List<GNavigationItem> children;
  final double height;
  final Color? backgroundColor;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  final Color? itemOverlayColor;
  final ValueChanged<int>? onSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: backgroundColor),
      child: Row(
        children: [
          for (int i = 0; i < children.length; i++)
            GNavigationItemProvider(
              index: i,
              selectedIndex: selectedIndex,
              height: height,
              selectedItemColor: selectedItemColor,
              unselectedItemColor: unselectedItemColor,
              itemOverlayColor: itemOverlayColor,
              onSelected: onSelected,
              child: children[i],
            )
        ],
      ),
    );
  }
}

class GNavigationItem extends StatefulWidget {
  const GNavigationItem({super.key, this.icon, this.label});

  final IconData? icon;
  final Widget? label;

  @override
  State<StatefulWidget> createState() => _GNavigationItemState();
}

class _GNavigationItemState extends State<GNavigationItem> {
  void onSelected(GNavigationItemProvider? provider) {
    provider?.onSelected?.call(provider.index);
  }

  @override
  Widget build(BuildContext context) {
    var provider = GNavigationItemProvider.of(context);
    return Expanded(
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(height: provider?.height),
        child: TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.resolveWith<Color?>(
              (states) {
                if (provider != null && provider.isSelected) {
                  return provider.selectedItemColor;
                }
                return provider?.unselectedItemColor;
              },
            ),
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
              (states) {
                return provider?.itemOverlayColor;
              },
            ),
          ),
          onPressed: () => onSelected(provider),
          child: Row(
            children: [
              Icon(widget.icon),
              if (widget.label != null) widget.label!,
            ],
          ),
        ),
      ),
    );
  }
}

class GNavigationItemProvider extends InheritedWidget {
  const GNavigationItemProvider({
    super.key,
    required this.index,
    required this.selectedIndex,
    required this.height,
    required this.selectedItemColor,
    required this.unselectedItemColor,
    required this.itemOverlayColor,
    required super.child,
    this.onSelected,
  });
  final int index;
  final int selectedIndex;
  final double height;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  final Color? itemOverlayColor;
  final ValueChanged<int>? onSelected;

  bool get isSelected => index == selectedIndex;

  static GNavigationItemProvider? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<GNavigationItemProvider>();
  }

  @override
  bool updateShouldNotify(covariant GNavigationItemProvider oldWidget) =>
      selectedIndex != oldWidget.selectedIndex;
}
