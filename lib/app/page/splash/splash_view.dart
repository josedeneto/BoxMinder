import 'package:appchat_with_gemini/app/core/ui/colors/app_colors.dart';
import 'package:appchat_with_gemini/app/page/home/home_view.dart';
import 'package:appchat_with_gemini/app/page/welcome/welcome_view.dart.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../core/ui/style/app_typography.dart';
import '../../services/user_service_i.dart';
import '../../services/user_service_impl.dart';

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
      navigator.pushReplacement(
        MaterialPageRoute(
          builder: (context) => const HomeView(),
        ),
      );
    } else {
      navigator.push(
        MaterialPageRoute(
          builder: (_) => const WelcomeView(),
        ),
      );
    }
  }

  @override
  void initState() {
    userService = UserServiceImpl();
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
