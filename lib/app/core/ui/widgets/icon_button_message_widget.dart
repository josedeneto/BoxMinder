import 'package:flutter/material.dart';

import '../colors/app_colors.dart';

class IconButtonMessageWidget extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  const IconButtonMessageWidget({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: 20,
        color: AppColors.i.secondaryHintColor,
      ),
    );
  }
}
