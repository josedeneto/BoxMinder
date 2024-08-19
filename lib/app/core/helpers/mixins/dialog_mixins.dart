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



Future<void> showExitconfirmationDialog(BuildContext context) async {
  final shouldExit = await showAdaptiveDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.i.secondaryHintColor,
          title: Text('Sair da aplicação', style: AppTypography.i.medium),
          content: Text(
            'Tem a certeza que quer sair da aplicação?',
            style: AppTypography.i.light,
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(foregroundColor: AppColors.i.text),
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: const Text('Cancelar'),
            ),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.i.text,
                foregroundColor: AppColors.i.primary,
              ),
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: Text(
                'Sim quero sair',
                style: AppTypography.i.regular.copyWith(
                  color: AppColors.i.secondaryHintColor,
                ),
              ),
            )
          ],
        );
      });
  return shouldExit ?? false;
}
