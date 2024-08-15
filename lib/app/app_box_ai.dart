import 'package:appchat_with_gemini/app/routes/app_routes.dart';
import 'package:appchat_with_gemini/app/services/user_service_i.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/ui/theme/app_theme.dart';
import 'services/user_service_impl.dart';

class AppBoxAi extends StatelessWidget {
  const AppBoxAi({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Provider<UserServiceI>(
        create: (context) => UserServiceImpl()..initialize(),
        child: MaterialApp(
          title: 'BoxAI',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.theme,
          initialRoute: AppRoutes.splash,
          routes: AppRoutes.routes,
        ),
      ),
    );
  }
}
