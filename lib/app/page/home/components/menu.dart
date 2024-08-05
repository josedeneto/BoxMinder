import 'package:appchat_with_gemini/app/core/ui/colors/app_colors.dart';
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
          color:AppColors.i.primary,
          border: Border.all(
            color: AppColors.i.borderSide,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(16),
        child: child,
      ),
    );
  }
}
