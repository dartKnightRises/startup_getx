import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'common_libs.dart';

// flutter run --flavor dev -t lib/main_dev.dart
// flutter run --flavor sit -t lib/main_sit.dart
// flutter run --flavor prod -t lib/main_prod.dart

Future<void> mainDelegate() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // Get.lazyPut(() => AppLogic());
  AppLogic appLogic = Get.put(AppLogic());
  await AppLogic().bootstrap();
  runApp(const MyApp());

  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLogic appLogic = Get.find();
    return
      Obx(() => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Environment Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        themeMode:appLogic.isDarkModeCustom.value ? ThemeMode.dark : ThemeMode.light,
        initialRoute: appLogic.isFirstTime.value?Routes.onboardingScreen:Routes.homeScreen,
        getPages: getPages,
      ));
  }
}
