import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:startup_getx/common_libs.dart';
import 'common/json_pref_file.dart';
import 'common/platform_info.dart';

class AppLogic extends GetxController{

  RxBool isBootstrapComplete = RxBool(false);
  RxBool isInternetConnected = RxBool(false);
  RxBool isFirstTime = RxBool(false);
  RxBool isDarkModeCustom=false.obs;

  final JsonPrefsFile brightnessModeStorage = JsonPrefsFile('myBrightnessMode');

  Size get deviceSize {
    final w = WidgetsBinding.instance.platformDispatcher.views.first;
    return w.physicalSize / w.devicePixelRatio;
  }

  bool get isDesktopOrTablet => PlatformInfo.isDesktopOrWeb || deviceSize.shortestSide > 480;


  Future<void> bootstrap() async {
    debugPrint('bootstrap app, deviceSize: $deviceSize, isTablet: $isDesktopOrTablet');
    // Default error handler
    FlutterError.onError = _handleFlutterError;
    debugPrint('ready in 1...');
    await Future.delayed(const Duration(seconds: 1));
    debugPrint('go!');
    isBootstrapComplete.value = true;
    await loadBrightnessMode();
    await _checkInternetConnection();
    _startInternetConnectionListener();
    await _checkFirstTime();
    debugPrint('bootstrap completed');
  }
  void _handleFlutterError(FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
  }
  Future<void> _checkInternetConnection() async {
    final hasConnection = await InternetConnectionChecker().hasConnection;
    isInternetConnected.value = hasConnection;
  }

  void _startInternetConnectionListener() {
    InternetConnectionChecker().onStatusChange.listen((status) {
      isInternetConnected.value = status == InternetConnectionStatus.connected;
    });
  }

  Future<void> _checkFirstTime() async {
    final JsonPrefsFile jsonPrefsFile = JsonPrefsFile('onboarding');
    final Map<String, dynamic> onboardingData = await jsonPrefsFile.load();
    isFirstTime.value = onboardingData['isFirstTime'] ?? true;
  }

  Future<void> markFirstTimeShown() async {
    final JsonPrefsFile jsonPrefsFile = JsonPrefsFile('onboarding');
    await jsonPrefsFile.save({'isFirstTime': false});
  }

  // loading brightness mode
  Future<void> loadBrightnessMode() async {
    final loadedBrightnessMode = await brightnessModeStorage.load();
    if (loadedBrightnessMode.containsKey('myBrightnessMode')) {
      isDarkModeCustom.value = loadedBrightnessMode['myBrightnessMode'];
      update();
    } else {
      await saveBrightnessMode();
    }
  }

  // saving current brightness mode
  Future<void> saveBrightnessMode() async {
    final dataToSave = {'myBrightnessMode': isDarkModeCustom.value};
    await brightnessModeStorage.save(dataToSave);
  }

  // toggling brightness
  Future<void> toggleBrightnessMode()async {
    print("before---------->"+isDarkModeCustom.value.toString());
    isDarkModeCustom.value = !isDarkModeCustom.value;
    print("after---------->"+isDarkModeCustom.value.toString());
    await saveBrightnessMode(); // Save the updated theme preference
    update();
  }
}