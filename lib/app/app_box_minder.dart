import 'package:flutter/material.dart';

import 'core/ui/theme/app_theme.dart';
import 'page/sign/sign_in_view.dart';
import 'page/splash/splash_view.dart';

class AppBoxMinder extends StatelessWidget {
  const AppBoxMinder({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme,
        home: const SignInView(),
      ),
    );
  }
}
