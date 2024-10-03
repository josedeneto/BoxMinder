import 'package:appchat_with_gemini/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/ui/colors/app_colors.dart';
import '../../core/ui/style/app_typography.dart';


class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  Future<void> checkUserStatus() async {
    
    final isLoggedIn = await SharedPreferences.getInstance();
    final result = isLoggedIn.getBool('isLoggedIn') ?? false;
    if(!mounted)return;
    if (result) {
      Navigator.pushReplacementNamed(context, AppRoutes.home);
    } else {
      Navigator.pushReplacementNamed(context,AppRoutes.welcome);
    }
  }

  @override
  void initState() {
    super.initState();
        checkUserStatus();
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
