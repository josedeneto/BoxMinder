import 'package:appchat_with_gemini/app/core/helpers/mixins/dialog_mixins.dart';
import 'package:appchat_with_gemini/app/core/ui/colors/app_colors.dart';
import 'package:appchat_with_gemini/app/core/ui/style/app_typography.dart';
import 'package:appchat_with_gemini/app/page/sign_in/controllers/sign_in_controllers.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../../core/ui/widgets/custom_button.dart';
import '../../core/ui/widgets/login_button_with_google.dart';
import '../../routes/app_routes.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignInView> with MessageDialog {
  late TextEditingController _emailC;
  late TextEditingController _passwordC;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailC = TextEditingController();
    _passwordC = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailC.dispose();
    _passwordC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SignInController>(builder: (context, controller, child) {
      return Scaffold(
        body: ColoredBox(
          color: AppColors.i.primary,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Form(
                    key: _formKey,
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
                          enabled: !controller.isLoading,
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
                          
                          ),
                          onChanged: (email) {
                            setState(() {
                              _emailC.text = email;
                            });
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          enabled: !controller.isLoading,
                          decoration: InputDecoration(
                            hintStyle: AppTypography.i.regular.copyWith(
                                color: AppColors.i.secondaryHintColor,
                                fontSize: 14),
                            prefixIcon: Icon(
                              Iconsax.lock,
                              color: AppColors.i.secondaryHintColor,
                            ),
                            hintText: 'Senha',
                            
                          ),
                          onChanged: (password) {
                            setState(() {
                              _passwordC.text = password;
                            });
                          },
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
                            onPressed: () async {
                              final navigator = Navigator.of(context);
                              final valid =
                                  _formKey.currentState?.validate() ?? false;
                              if (valid) {
                                showMessageDialog('A processar...');
                                await controller.signIn(
                                    _emailC.text, _passwordC.text);
                                navigator.pop();
                                navigator.pushNamed(AppRoutes.home);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: const Text('Erro ao efectuar login'),
                                    backgroundColor: Colors.red.shade700,
                                  ),
                                );
                              }
                            },
                          ),
                        )
                      ],
                    ),
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
    });
  }
}
