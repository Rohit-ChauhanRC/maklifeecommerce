import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maklifeecommerce/app/utils/app_colors/app_colors.dart';
// import 'package:get/get.dart';

class UploadImageWidget extends StatelessWidget {
  final void Function()? onTap;
  final XFile imageFile;
  final double? width;
  final double? height;

  const UploadImageWidget({
    Key? key,
    required this.onTap,
    required this.imageFile,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      child: CircleAvatar(
        radius: 100,
        backgroundColor: AppColors.greenColor,
        // color: Colors.white,
        backgroundImage:
            imageFile != null && imageFile.path != null && imageFile.path != ""
                ? Image.file(
                    File(imageFile.path),
                    fit: BoxFit.contain,
                  ).image
                : Image.asset("assets/images/images.png").image,
      ),
    );
  }
}
