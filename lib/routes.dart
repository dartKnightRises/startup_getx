import 'common_libs.dart';
import 'package:startup_getx/view/screens/home_screen/home_screen.dart';
import 'package:startup_getx/view/screens/onboarding_screen/onboarding_screen.dart';

class Routes {
  static String homeScreen = '/homeScreen';
  static String onboardingScreen = '/onboardingScreen';
}

final getPages = [
  GetPage(name: Routes.homeScreen, page: () => const HomeScreen()),
  GetPage(name: Routes.onboardingScreen, page: () =>  const OnboardingScreen())
];
