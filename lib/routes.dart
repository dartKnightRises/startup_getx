import 'common_libs.dart';
import 'package:startup_getx/view/screens/home_screen/home_screen.dart';

class Routes {
  static String homeScreen = '/homeScreen';
}

final getPages = [
  GetPage(name: Routes.homeScreen, page: () => const HomeScreen())
];
