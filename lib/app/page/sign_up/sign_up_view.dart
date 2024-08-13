import 'package:appchat_with_gemini/app/core/helpers/mixins/dialog_mixins.dart';
import 'package:appchat_with_gemini/app/page/sign_up/controllers/sign_up_controller.dart';
import 'package:appchat_with_gemini/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../../core/ui/colors/app_colors.dart';
import '../../core/ui/style/app_typography.dart';
import '../../core/ui/widgets/custom_button.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> with MessageDialog {
  late TextEditingController emailC;
  late TextEditingController senhaC;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    emailC = TextEditingController();
    senhaC = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailC.dispose();
    senhaC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SignUpController>(builder: (context, controller, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.i.primary,
          leading: IconButton.filled(
            color: AppColors.i.white,
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(AppColors.i.border),
            ),
            onPressed: () {},
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        backgroundColor: AppColors.i.primary,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Form(
            key: _formKey,
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
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Para começar informe os seus dados de acesso',
                        style: AppTypography.i.light
                            .copyWith(color: AppColors.i.border),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        enabled: !controller.isLoading,
                        keyboardType: TextInputType.emailAddress,
                        controller: emailC,
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
                            emailC.text = email;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        enabled: !controller.isLoading,
                        controller: senhaC,
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
                            senhaC.text = password;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: CustomButton(
                    text: 'Registar-se',
                    onPressed: () async {
                      final navigator = Navigator.of(context);
                      final valid = _formKey.currentState?.validate() ?? false;
                      if (valid) {
                        showMessageDialog('Registando...');
                        await controller.signUp(
                            emailC.text.trim(), senhaC.text.trim());
                        navigator.pop();
                        navigator.pushNamed(AppRoutes.boxai);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text('Erro ao registar'),
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
      );
    });
  }
}
