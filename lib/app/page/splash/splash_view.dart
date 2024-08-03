import 'package:appchat_with_gemini/app/core/ui/colors/app_colors.dart';
import 'package:appchat_with_gemini/app/page/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../core/ui/style/app_typography.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Future<void> nextPage() async {
    final navigator = Navigator.of(context);
    await Future.delayed(const Duration(seconds: 3));
    navigator.pushReplacement(
      MaterialPageRoute(
        builder: (context) => const HomeView(),
      ),
    );
  }

  @override
  void initState() {
    nextPage();
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
