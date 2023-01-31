import 'package:appointment_demo/app/app_colors.dart';
import 'package:appointment_demo/app/app_font_weight.dart';
import 'package:appointment_demo/app/app_fonts_size.dart';
import 'package:appointment_demo/app/app_strings.dart';
import 'package:appointment_demo/ui/appointment/controller/appointment_controller.dart';
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

class AppointmentPage extends GetView<AppointmentController> {
  const AppointmentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Utils.closeKeyboard(),
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: CommonAppBar(
                title: controller.arguments.homeModel?.firstName != null && controller.arguments.homeModel?.firstName != ''
                    ? AppStrings.editAppointment
                    : AppStrings.bookAppointment,
                onBackTap: () => Get.back()),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 30.h),
                  Text('${AppStrings.slot}: ${controller.arguments.homeModel?.slot}',
                      style: GoogleFonts.roboto(
                          fontSize: fontSize17, fontWeight: AppFontWeight.regular, color: AppColors.color1D1D1F)),
                  SizedBox(height: 20.h),
                  Obx(
                    () => Focus(
                      onFocusChange: (value) {
                        controller.isFocusedFirstName.value = value;
                        if (value) Utils.hideMessage();
                      },
                      child: CommonAppInputFloating(
                        textEditingController: controller.firstNameController,
                        textInputType: TextInputType.name,
                        hintText: AppStrings.firstName,
                        textInputAction: TextInputAction.next,
                        maxLength: 50,
                        isFocused: controller.isFocusedFirstName.isTrue,
                        currentFocusNode: controller.firstNameFocusNode,
                        nextFocusNode: controller.lastNameFocusNode,
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Obx(
                    () => Focus(
                      onFocusChange: (value) {
                        controller.isFocusedLastName.value = value;
                        if (value) Utils.hideMessage();
                      },
                      child: CommonAppInputFloating(
                        textEditingController: controller.lastNameController,
                        textInputType: TextInputType.name,
                        hintText: AppStrings.lastName,
                        textInputAction: TextInputAction.next,
                        maxLength: 50,
                        isFocused: controller.isFocusedLastName.isTrue,
                        currentFocusNode: controller.lastNameFocusNode,
                        nextFocusNode: controller.phoneNumberFocusNode,
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Obx(
                    () => Focus(
                      onFocusChange: (value) {
                        controller.isFocusedPhoneNumber.value = value;
                        if (value) Utils.hideMessage();
                      },
                      child: CommonAppInputFloating(
                        textEditingController: controller.phoneNumberController,
                        textInputType: TextInputType.number,
                        hintText: AppStrings.phoneNumber,
                        maxLength: 10,
                        isFocused: controller.isFocusedPhoneNumber.isTrue,
                        currentFocusNode: controller.phoneNumberFocusNode,
                        regExp: RegExp(r'([0-9])'),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CommonAppButton(
                        text: AppStrings.cancel,
                        onClick: () => Get.back(),
                        isExpanded: false,
                        radius: 10,
                        innerHorizontalPadding: 20,
                      ),
                      CommonAppButton(
                        text: AppStrings.save,
                        onClick: () => controller.onSave(),
                        isExpanded: false,
                        radius: 10,
                        innerHorizontalPadding: 20,
                      ),
                    ],
                  )
                ],
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
