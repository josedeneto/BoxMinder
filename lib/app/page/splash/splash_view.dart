import 'package:appchat_with_gemini/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../../core/ui/colors/app_colors.dart';
import '../../core/ui/style/app_typography.dart';
import '../../services/user_service_i.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late UserServiceI userService;

  Future<void> _initialize() async {
    await Future.delayed(const Duration(seconds: 3));
    await checkUserStatus();
  }

  Future<void> checkUserStatus() async {
    final navigator = Navigator.of(context);
    final isLoggedIn = await userService.checkLoginStatus();
    if (isLoggedIn) {
      navigator.pushNamed(AppRoutes.home);
    } else {
      navigator.pushNamed(AppRoutes.welcome);
    }
  }

  @override
  void initState() {
    userService = context.read<UserServiceI>();
    _initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColoredBox(
        color: AppColors.i.primary,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                maxRadius: 26,
                backgroundColor: Colors.white,
                child: Icon(
                  Iconsax.dcube,
                  size: 33,
                  color: AppColors.i.primary,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'BOXAI',
                style: AppTypography.i.bold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
