import 'package:flutter/material.dart';

class AppListView extends StatelessWidget {
  const AppListView({
    super.key,
    required this.direction,
    required this.seperator,
    required this.children,
  });
  final Axis direction;
  final Widget seperator;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: direction,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => children[index],
      separatorBuilder: (context, index) => seperator,
      itemCount: children.length,
    );
  }
}
