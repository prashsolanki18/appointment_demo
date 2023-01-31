import 'package:appointment_demo/app/app_class.dart';
import 'package:appointment_demo/app/app_colors.dart';
import 'package:appointment_demo/app/app_routes.dart';
import 'package:appointment_demo/app/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppColors.colorWhite,
    statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
    statusBarBrightness: Brightness.light,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: AppTheme.designSize,
      builder: (context, widget) {
        return GetMaterialApp(
          enableLog: true,
          debugShowCheckedModeBanner: false,
          title: 'AppointmentDemo',
          theme: ThemeData(
            primarySwatch: AppColors.primaryPalette,
            scaffoldBackgroundColor: AppColors.colorWhite,
          ),
          builder: (context, widget) => ColoredBox(
            color: AppColors.colorWhite,
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (OverscrollIndicatorNotification overscroll) {
                overscroll.disallowIndicator();
                return true;
              },
              child: MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: getMainAppViewBuilder(context, widget)),
            ),
          ),
          getPages: AppRoutes.pages,
          initialRoute: AppRoutes.homePage,
          locale: Get.deviceLocale,
          fallbackLocale: const Locale('en'),
        );
      },
    );
  }

  /// Create main app view builder
  Widget getMainAppViewBuilder(BuildContext context, Widget? widget) {
    return Stack(
      children: [
        Obx(() {
          return IgnorePointer(
            ignoring: AppClass().isShowLoading.isTrue,
            child: Stack(
              children: [
                widget ?? const Offstage(),
              ],
            ),
          );
        })
      ],
    );
  }
}
