import 'package:appchat_with_gemini/app/core/ui/colors/app_colors.dart';
import 'package:appchat_with_gemini/app/core/ui/style/app_style.dart';
import 'package:appchat_with_gemini/app/core/ui/style/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../core/ui/widgets/custom_button.dart';
import '../../core/ui/widgets/login_button_with_google.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignInView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColoredBox(
        color: AppColors.i.primary,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Iconsax.dcube,
                              size: 33,
                              color: AppColors.i.primary,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'BOXAI',
                            style: AppTypography.i.regular.copyWith(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintStyle: AppTypography.i.regular.copyWith(
                          color: AppColors.i.secondaryHintColor,
                          fontSize: 14,
                        ),
                        prefixIcon: Icon(
                          Iconsax.direct_right,
                          color: AppColors.i.secondaryHintColor,
                        ),
                        hintText: 'E-mail',
                        enabledBorder:AppStyle.i.defaulTextFieldBorder ,
                        border:AppStyle.i.defaulTextFieldBorder,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintStyle: AppTypography.i.regular.copyWith(
                            color: AppColors.i.secondaryHintColor,
                            fontSize: 14),
                        prefixIcon: Icon(
                          Iconsax.lock,
                          color: AppColors.i.secondaryHintColor,
                        ),
                        hintText: 'Senha',
                        focusedBorder: AppStyle.i.defaulTextFieldBorder,
                        enabledBorder: AppStyle.i.defaulTextFieldBorder,
                        border: AppStyle.i.defaulTextFieldBorder,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Esqueci a senha',
                          style: AppTypography.i.regular,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: CustomButton(
                        text: 'Entrar',
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: LoginButtonWithGoogle(
                  text: 'Entrar com Google',
                  onTap: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
