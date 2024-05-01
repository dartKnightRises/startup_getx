import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'common_libs.dart';
import 'controller/logic/app_logic.dart';

// flutter run --flavor dev -t lib/main_dev.dart
// flutter run --flavor sit -t lib/main_sit.dart
// flutter run --flavor prod -t lib/main_prod.dart

Future<void> mainDelegate() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  AppLogic appLogic = Get.put(AppLogic());
  await appLogic.bootstrap();
  runApp(const MyApp());

  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Environment Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.homeScreen,
      getPages: getPages,
    );
  }
}
