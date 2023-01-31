import 'package:appointment_demo/app/app_colors.dart';
import 'package:appointment_demo/app/app_font_weight.dart';
import 'package:appointment_demo/app/app_fonts_size.dart';
import 'package:appointment_demo/app/app_strings.dart';
import 'package:appointment_demo/ui/home/controller/home_controller.dart';
import 'package:appointment_demo/ui/home/model/home_model.dart';
import 'package:appointment_demo/ui/widgets/common_ink_well.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.colorWhite,
          centerTitle: true,
          title: Text(AppStrings.bookYourSlot,
              style: GoogleFonts.roboto(
                  fontSize: fontSize30, fontWeight: AppFontWeight.bold, color: AppColors.primaryPalette))),
      body: Obx(
        () => ListView.builder(
            itemCount: controller.slotList.length,
            itemBuilder: (_, index) {
              return getSlotItem(controller.slotList[index], index)
                  .paddingOnly(bottom: index == controller.slotList.length - 1 ? 100 : 0);
            }),
      ),
      floatingActionButton: CommonInkWell(
        onTap: () => controller.openGallery(),
        child: Container(
          decoration: BoxDecoration(color: AppColors.primaryPalette, shape: BoxShape.circle),
          child: const Icon(
            Icons.person_outline,
            size: 40,
            color: AppColors.colorWhite,
          ).paddingAll(15),
        ),
      ),
    );
  }

  ///[getSlotItem] is used to show slot item
  Widget getSlotItem(HomeModel slotList, int index) {
    return CommonInkWell(
      onTap: () {
        controller.navigateToAppointmentPage(index);
      },
      child: Card(
        elevation: 4,
        color: slotList.firstName != null && slotList.firstName != '' ? AppColors.primaryPalette : null,
        child: Text(
          slotList.slot,
          style: GoogleFonts.roboto(
              fontSize: fontSize26,
              fontWeight: AppFontWeight.semiBold,
              color: slotList.firstName != null && slotList.firstName != '' ? AppColors.colorWhite : AppColors.color1C1C1C),
          textAlign: TextAlign.center,
        ).paddingSymmetric(horizontal: 10.w, vertical: 10.h),
      ),
    );
  }
}
