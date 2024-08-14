
import 'package:appchat_with_gemini/app/core/helpers/size_extensions.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/ui/colors/app_colors.dart';
import '../../../core/ui/style/app_typography.dart';
import 'suggested_question.dart';

class ExampleQuestions extends StatelessWidget {
  const ExampleQuestions({
    super.key,
    required this.showWindows,
    required this.images,
  });

  final bool showWindows;
  final List<XFile>? images;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !showWindows && images!.isEmpty,
      child: Positioned(
        bottom: context.percentHeight(.1),
        child: Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                SizedBox(
                  width: 150,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: AppColors.i.borderSide),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.light_mode_outlined,
                            color: AppColors.i.text,
                            size: 18,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            'Exemplos',
                            style: AppTypography.i.light
                                .copyWith(fontSize: 13),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SuggestedQuestion(
                        question:
                            'Roadmap 2024 para aprender Flutter',
                      ),
                      SuggestedQuestion(
                        question:
                            'Contar uma piada para se divertir',
                      ),
                      SuggestedQuestion(
                        question:
                            'Sugeria hábitos positivos para o bem-estar',
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
