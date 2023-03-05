import "package:flutter/material.dart";
import "package:insta_clone/provider/provider.dart";
import "package:provider/provider.dart";

import '../utils/global_variables.dart';

class ResponsiveLayout extends StatefulWidget {
  final Widget webLayout;
  final Widget mobileLayout;

  const ResponsiveLayout(
      {super.key, required this.webLayout, required this.mobileLayout});

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  @override
  void initState() {
    super.initState();
    addData();
  }

  addData() async {
    UserProvider provider = Provider.of(context, listen: false);
    await provider.refreshUser();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > webScreenSize) {
          return widget.webLayout;
        }
        return widget.mobileLayout;
      },
    );
  }
}
