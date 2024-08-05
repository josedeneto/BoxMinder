import 'package:appchat_with_gemini/app/core/ui/colors/app_colors.dart';
import 'package:appchat_with_gemini/app/core/ui/style/app_typography.dart';
import 'package:flutter/material.dart';

class MenuItemTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;
  const MenuItemTile({super.key, required this.icon, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              
              border: Border.all(
                color: AppColors.i.borderSide,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Icon(
                icon,
                color: AppColors.i.white,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            text,
            style:  AppTypography.i.medium,
          )
        ],
      ),
    );
  }
}
