import 'package:appchat_with_gemini/app/page/home/home_view.dart';
import 'package:flutter/material.dart';

import 'core/ui/theme/app_theme.dart';
import 'page/splash/splash_view.dart';

class AppBoxAi extends StatelessWidget {
  const AppBoxAi({super.key});

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
        home: const HomeView(),
      ),
    );
  }
}
