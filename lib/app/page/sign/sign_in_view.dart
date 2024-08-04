import 'package:appchat_with_gemini/app/core/ui/colors/app_colors.dart';
import 'package:appchat_with_gemini/app/core/ui/style/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

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
                        //   filled: true,
                        hintStyle: AppTypography.i.regular.copyWith(
                            color: Color.fromARGB(255, 51, 51, 66),
                            fontSize: 14),
                        // fillColor: Color.fromARGB(255, 13, 13, 15),
                        prefixIcon: const Icon(
                          Iconsax.direct_right,
                          color: Color.fromARGB(255, 51, 51, 66),
                        ),
                        hintText: 'E-mail',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 29, 29, 39))),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.red)),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        // filled: true,
                        hintStyle: AppTypography.i.regular.copyWith(
                            color: Color.fromARGB(255, 51, 51, 66),
                            fontSize:
                                14), //TextStyle(color: AppColors.i.hintTextField,fontSize: 14),
                        //  fillColor: Color.fromARGB(255, 13, 13, 15),
                        prefixIcon: Icon(
                          Iconsax.lock,
                          color: Color.fromARGB(255, 51, 51, 66),
                        ),
                        hintText: 'Senha',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 23, 23, 32))),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
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
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            elevation: 1,
                            backgroundColor: AppColors.i.button,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            foregroundColor: AppColors.i.primary),
                        child: Text(
                          'Criar conta',
                          style: AppTypography.i.extraLight.copyWith(
                              color: AppColors.i.primary,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(color: Color.fromARGB(255, 51, 51, 66)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const FlutterLogo(),
                        Text(
                          'Entrar com Google',
                          style: AppTypography.i.medium,
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: AppColors.i.border,
                          size: 16,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
