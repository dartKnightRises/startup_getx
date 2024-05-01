import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:startup_getx/common_libs.dart';
import 'common/platform_info.dart';

class AppLogic extends GetxController{

  RxBool isBootstrapComplete = RxBool(false);
  RxBool isInternetConnected = RxBool(false);

  Size get deviceSize {
    final w = WidgetsBinding.instance.platformDispatcher.views.first;
    return w.physicalSize / w.devicePixelRatio;
  }

  bool get isDesktopOrTablet => PlatformInfo.isDesktopOrWeb || deviceSize.shortestSide > 480;


  Future<void> bootstrap() async {
    debugPrint('bootstrap app, deviceSize: $deviceSize, isTablet: $isDesktopOrTablet');
    // Default error handler
    FlutterError.onError = _handleFlutterError;
    debugPrint('ready in 3...');
    await Future.delayed(const Duration(seconds: 1));
    debugPrint('ready in 2...');
    await Future.delayed(const Duration(seconds: 1));
    debugPrint('ready in 1...');
    await Future.delayed(const Duration(seconds: 1));
    debugPrint('go!');
    isBootstrapComplete.value = true;
    await _checkInternetConnection();
    _startInternetConnectionListener();
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
}