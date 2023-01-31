// ignore_for_file: must_be_immutable

import 'package:appointment_demo/app/app_colors.dart';
import 'package:appointment_demo/app/app_font_weight.dart';
import 'package:appointment_demo/app/app_fonts_size.dart';
import 'package:appointment_demo/app/app_strings.dart';
import 'package:appointment_demo/ui/appointment/controller/appointment_controller.dart';
import 'package:appointment_demo/ui/home/controller/home_controller.dart';
import 'package:appointment_demo/ui/home/model/home_model.dart';
import 'package:appointment_demo/ui/widgets/common_app_bar.dart';
import 'package:appointment_demo/ui/widgets/common_app_button.dart';
import 'package:appointment_demo/ui/widgets/common_app_input_floating.dart';
import 'package:appointment_demo/ui/widgets/common_ink_well.dart';
import 'package:appointment_demo/utility/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AppointmentDetailPage extends StatelessWidget {
  AppointmentDetailPage({Key? key}) : super(key: key);

  HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Utils.closeKeyboard(),
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: CommonAppBar(
                title: AppStrings.appointmentDetail,
                onBackTap: () => Get.back(),
                isShowActionButton: true,
                actionButtonTitle: AppStrings.edit,
                onActionTap: () => controller.navigateToAppointmentPage(controller.selectedIndex, isFromDetailPage: true)),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30.h),
                    Text('${AppStrings.slot}: ${controller.slotList[controller.selectedIndex].slot}',
                        style: GoogleFonts.roboto(
                            fontSize: fontSize17, fontWeight: AppFontWeight.regular, color: AppColors.color1D1D1F)),
                    SizedBox(height: 20.h),
                    Text('${AppStrings.firstName}: ${controller.slotList[controller.selectedIndex].firstName}',
                        style: GoogleFonts.roboto(
                            fontSize: fontSize17, fontWeight: AppFontWeight.regular, color: AppColors.color1D1D1F)),
                    SizedBox(height: 20.h),
                    Text('${AppStrings.lastName}: ${controller.slotList[controller.selectedIndex].lastName}',
                        style: GoogleFonts.roboto(
                            fontSize: fontSize17, fontWeight: AppFontWeight.regular, color: AppColors.color1D1D1F)),
                    SizedBox(height: 20.h),
                    Text('${AppStrings.phoneNumber}: ${controller.slotList[controller.selectedIndex].phoneNumber}',
                        style: GoogleFonts.roboto(
                            fontSize: fontSize17, fontWeight: AppFontWeight.regular, color: AppColors.color1D1D1F)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  ///[getSlotItem] is used to show slot item
  Widget getSlotItem(HomeModel slotList) {
    return CommonInkWell(
      onTap: () {
        debugPrint('fd');
      },
      child: Card(
        elevation: 4,
        child: Text(
          slotList.slot,
          style: GoogleFonts.roboto(fontSize: fontSize26, fontWeight: AppFontWeight.semiBold, color: AppColors.color1C1C1C),
          textAlign: TextAlign.center,
        ).paddingSymmetric(horizontal: 10.w, vertical: 10.h),
      ),
    );
  }
}
