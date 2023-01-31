import 'package:appointment_demo/app/app_data_model.dart';
import 'package:appointment_demo/app/app_routes.dart';
import 'package:appointment_demo/ui/home/model/home_model.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HomeController extends GetxController {
  RxList<HomeModel> slotList = <HomeModel>[].obs;
  int selectedIndex = 0;

  @override
  void onInit() {
    super.onInit();
    generateSlot();
  }

  ///[generateSlot] is used to create static slot list
  void generateSlot() {
    slotList.add(HomeModel(slot: '9:00AM to 9:30AM'));
    slotList.add(HomeModel(slot: '9:30AM to 10:00AM'));
    slotList.add(HomeModel(slot: '10:00AM to 10:30AM'));
    slotList.add(HomeModel(slot: '10:30AM to 11:00AM'));
    slotList.add(HomeModel(slot: '11:00AM to 11:30AM'));
    slotList.add(HomeModel(slot: '11:30AM to 12:00PM'));
    slotList.add(HomeModel(slot: '12:00PM to 12:30PM'));
    slotList.add(HomeModel(slot: '12:30PM to 1:00PM'));
    slotList.add(HomeModel(slot: '1:00PM to 1:30PM'));
    slotList.add(HomeModel(slot: '1:30PM to 2:00PM'));
    slotList.add(HomeModel(slot: '2:00PM to 2:30PM'));
    slotList.add(HomeModel(slot: '2:30PM to 3:00PM'));
    slotList.add(HomeModel(slot: '3:00PM to 3:30PM'));
    slotList.add(HomeModel(slot: '3:30PM to 4:00PM'));
    slotList.add(HomeModel(slot: '4:00PM to 4:30PM'));
    slotList.add(HomeModel(slot: '4:30PM to 5:00PM'));
    slotList.add(HomeModel(slot: '5:00PM to 5:30PM'));
    slotList.add(HomeModel(slot: '5:30PM to 6:00PM'));
  }

  ///[navigateToAppointmentPage] is used when user select time slot
  void navigateToAppointmentPage(int index, {bool isFromDetailPage = false}) {
    selectedIndex = index;
    if (slotList[index].firstName != null && slotList[index].firstName != '' && !isFromDetailPage) {
      Get.toNamed(AppRoutes.appointmentDetailPage);
    } else {
      Get.toNamed(AppRoutes.appointmentPage, arguments: AppDataModel(homeModel: slotList[index]))?.then((value) {
        if (value is AppDataModel) {
          AppDataModel appDataModel = value;
          slotList[index] = appDataModel.homeModel!;
        }
      });
    }
  }

  ///[openGallery] is used when user click on profile select floating button
  Future<void> openGallery() async {
    final XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
  }
}
