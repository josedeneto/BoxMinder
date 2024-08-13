import 'package:flutter/material.dart';

import '../../ui/colors/app_colors.dart';
import '../../ui/style/app_typography.dart';

mixin MessageDialog<T extends StatefulWidget> on State<T> {
  void showMessageDialog(String message) {
    showAdaptiveDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          contentPadding: const EdgeInsets.all(16),
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: AppColors.i.borderSide,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator.adaptive(
                    valueColor: AlwaysStoppedAnimation(AppColors.i.text),
                  ),
                ),
                const SizedBox(width: 2),
                Text(
                  message,
                  style: AppTypography.i.semiBold.copyWith(fontSize: 14),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
