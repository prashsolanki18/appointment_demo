import 'package:appointment_demo/app/app_data_model.dart';
import 'package:appointment_demo/app/app_strings.dart';
import 'package:appointment_demo/ui/home/model/home_model.dart';
import 'package:appointment_demo/utility/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentController extends GetxController {
  late AppDataModel arguments;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  FocusNode firstNameFocusNode = FocusNode();
  FocusNode lastNameFocusNode = FocusNode();
  FocusNode phoneNumberFocusNode = FocusNode();
  RxBool isFocusedFirstName = false.obs;
  RxBool isFocusedLastName = false.obs;
  RxBool isFocusedPhoneNumber = false.obs;

  @override
  void onInit() {
    super.onInit();
    arguments = Get.arguments as AppDataModel;
    if (arguments.homeModel?.firstName != null && arguments.homeModel?.firstName != '') {
      firstNameController.text = arguments.homeModel?.firstName ?? '';
      lastNameController.text = arguments.homeModel?.lastName ?? '';
      phoneNumberController.text = arguments.homeModel?.phoneNumber ?? '';
    }
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    phoneNumberController.dispose();
    firstNameFocusNode.dispose();
    lastNameFocusNode.dispose();
    phoneNumberFocusNode.dispose();
    super.dispose();
  }

  ///[onSave] is called when user pressed on save button
  void onSave() {
    Utils.closeKeyboard();
    if (isAppointmentValid()) {
      Get.back(
        result: AppDataModel(
          homeModel: HomeModel(
            slot: arguments.homeModel?.slot ?? '',
            firstName: firstNameController.text,
            lastName: lastNameController.text,
            phoneNumber: phoneNumberController.text,
          ),
        ),
      );
    }
  }

  ///[isAppointmentValid] is used to check necessary validation
  bool isAppointmentValid() {
    if (firstNameController.text.trim().isEmpty) {
      Utils.showMessage(AppStrings.error, AppStrings.pleaseEnterFirstName);
      return false;
    } else if (lastNameController.text.trim().isEmpty) {
      Utils.showMessage(AppStrings.error, AppStrings.pleaseEnterLastName);
      return false;
    } else if (phoneNumberController.text.length != 10) {
      Utils.showMessage(AppStrings.error, AppStrings.pleaseEnter10DigitPhoneNumber);
      return false;
    }
    return true;
  }
}
