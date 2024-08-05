
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/ui/colors/app_colors.dart';

class ImageSelectWidget extends StatelessWidget {
final XFile image;
  const ImageSelectWidget({
    super.key,
    required this.image
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: 2),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          children: [
            Image.file(
              File(image.path),
              fit: BoxFit.cover,
              width: 100,
              height: 80,
            ),
            Positioned(
              top: 2,
              right: 2,
              child: GestureDetector(
                child: CircleAvatar(
                  radius: 8,
                  backgroundColor: AppColors.i.primary,
                  child: Icon(
                    Icons.close,
                    size: 12,
                    color: AppColors.i.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
