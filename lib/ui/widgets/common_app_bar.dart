import 'package:appointment_demo/app/app_colors.dart';
import 'package:appointment_demo/app/app_font_weight.dart';
import 'package:appointment_demo/app/app_fonts_size.dart';
import 'package:appointment_demo/app/app_images.dart';
import 'package:appointment_demo/ui/widgets/common_app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

/// Common app bar used in whole app
class CommonAppBar extends StatelessWidget {
  final String title;
  final VoidCallback onBackTap;
  final bool isShowActionButton;
  final String? actionButtonTitle;
  final VoidCallback? onActionTap;
  final bool isActionLoading;

  const CommonAppBar({
    Key? key,
    required this.title,
    required this.onBackTap,
    this.isShowActionButton = false,
    this.actionButtonTitle,
    this.onActionTap,
    this.isActionLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: 13.w,
              right: isShowActionButton ? 12.w : 18.w,
              top: isShowActionButton ? 9 : 5.5,
              bottom: isShowActionButton ? 9 : 5.5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                splashColor: AppColors.colorTransparent,
                highlightColor: AppColors.colorTransparent,
                onTap: onBackTap,
                child: const CommonAppImage(imagePath: AppImages.icBack, width: 18, height: 18).paddingAll(5),
              ),
              const SizedBox(width: 15),
              Text(title,
                  style: GoogleFonts.montserrat(
                      fontSize: fontSize17, fontWeight: AppFontWeight.regular, color: AppColors.color1D1D1F)),
              if (isShowActionButton) ...[
                const SizedBox(width: 15),
                const Spacer(),
                isActionLoading
                    ? SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(color: AppColors.primaryPalette, strokeWidth: 2.5))
                    : GestureDetector(
                        onTap: onActionTap,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: AppColors.colorF3F3F3,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Text(actionButtonTitle ?? '',
                              style: GoogleFonts.montserrat(
                                  fontSize: fontSize17, fontWeight: AppFontWeight.regular, color: AppColors.color1D1D1F)),
                        ),
                      )
              ]
            ],
          ),
        ),
        const Divider(color: AppColors.colorE5E5E5, height: 1, thickness: 1),
      ],
    );
  }
}
