import 'package:flutter/material.dart';
import 'package:instragram_clone/utils/dimensions.dart';

class Responsivelayout extends StatelessWidget {
  final Widget webScreenLayout;
  final Widget mobileScreenLayout;
  const Responsivelayout(
      {super.key,
      required this.webScreenLayout,
      required this.mobileScreenLayout});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > webScreenSize) {
          // webscreen layout
          return webScreenLayout;
        }

        // mobile screen layout
        return mobileScreenLayout;
      },
    );
  }
}
