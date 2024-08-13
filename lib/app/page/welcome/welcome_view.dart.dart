import 'package:appchat_with_gemini/app/core/ui/colors/app_colors.dart';
import 'package:appchat_with_gemini/app/core/ui/widgets/custom_button.dart';
import 'package:appchat_with_gemini/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../core/ui/style/app_typography.dart';
import '../../core/ui/widgets/login_button_with_google.dart';


class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColoredBox(
        color: AppColors.i.primary,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: AppColors.i.white,
                  child: Icon(
                    Iconsax.dcube,
                    size: 33,
                    color: AppColors.i.primary,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Bem-vindo👋',
                    style: AppTypography.i.extraLight.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: 45,
                  child: CustomButton(
                    text: 'Regista-se gratuitamente',
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.signUp);
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                LoginButtonWithGoogle(
                  text: 'Continuar com Google',
                  onTap: () {},
                ),
                const SizedBox(
                  height: 25,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.signIn);
                  },
                  child: Text(
                    "Iniciar sessão",
                    style: AppTypography.i.medium,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
