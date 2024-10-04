import 'package:appchat_with_gemini/app/routes/app_routes.dart';
import 'package:flutter/material.dart';

import 'core/ui/theme/app_theme.dart';

class AppBoxAi extends StatelessWidget {
  const AppBoxAi({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior:HitTestBehavior.opaque,
      onTap: (){
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MaterialApp(
          title: 'BoxAI',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.theme,
          initialRoute: AppRoutes.splash,
          routes: AppRoutes.routes,
        ),
    );
    
  }
}
