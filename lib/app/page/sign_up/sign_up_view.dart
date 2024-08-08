import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../core/ui/colors/app_colors.dart';
import '../../core/ui/style/app_style.dart';
import '../../core/ui/style/app_typography.dart';
import '../../core/ui/widgets/custom_button.dart';


class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColoredBox(
        color: AppColors.i.primary,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Registar-se",
                      style: AppTypography.i.bold.copyWith(fontSize: 20),
                    ),
                    Text(
                      'Para começar informe os seus dados de acesso',
                      style: AppTypography.i.light.copyWith(color: AppColors.i.border),
                    ),
                    const SizedBox(
                      height: 10,
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
                        enabledBorder: AppStyle.i.defaulTextFieldBorder,
                        border: AppStyle.i.defaulTextFieldBorder,
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
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: CustomButton(
                  text: 'Registar-se',
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
