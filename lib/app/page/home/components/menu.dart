import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({
    super.key,
    required this.child,
    required this.showWindows,
  });
  final Widget child;
  final bool showWindows;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 500),
      bottom: showWindows ? 60 : -150,
      left: 0,
      right: 0,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0XFF1C1C1C),
          border: Border.all(
            color: const Color(0XFF343434),
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(16),
        child: child,
      ),
    );
  }
}
