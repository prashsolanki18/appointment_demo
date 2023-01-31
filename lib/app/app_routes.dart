import 'package:appointment_demo/ui/appointment/binding/appointment_binding.dart';
import 'package:appointment_demo/ui/appointment/view/appointment_page.dart';
import 'package:appointment_demo/ui/appointment_detail/view/appointment_detail_page.dart';
import 'package:appointment_demo/ui/home/binding/home_binding.dart';
import 'package:appointment_demo/ui/home/view/home_page.dart';
import 'package:get/get.dart';

/// All routes for app pages are defined here
class AppRoutes {
  static const homePage = '/home_page';
  static const appointmentPage = '/appointment_page';
  static const appointmentDetailPage = '/appointment_detail_page';

  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.homePage,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.appointmentPage,
      page: () => const AppointmentPage(),
      binding: AppointmentBinding(),
    ),
    GetPage(
      name: AppRoutes.appointmentDetailPage,
      page: () => AppointmentDetailPage(),
    )
  ];
}
