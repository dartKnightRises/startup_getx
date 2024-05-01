import 'package:startup_getx/common_libs.dart';
import '../../../controller/logic/app_logic.dart';
import '../../../flavor/env.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLogic appLogic = Get.find();
    Color bannerColor;
    switch (Constants.envName) {
      case 'dev':
        bannerColor = $styles.colors.devBanner;
        break;
      case 'sit':
        bannerColor = $styles.colors.sitBanner;
        break;
      case 'prod':
        bannerColor = $styles.colors.prodBanner;
        break;
      default:
        bannerColor = $styles.colors
            .appCharcoalPrimary; // Default color for unknown environments
        break;
    }
    return Obx(() => appLogic.isInternetConnected.value
        ? Scaffold(
            body: Stack(
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Server One: ${Constants.serverOne}'),
                      Text('Server Two: ${Constants.serverTwo}'),
                    ],
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: SizedBox(
                    width: 120,
                    height: 120,
                    child: Banner(
                      message: Constants.envName,
                      location: BannerLocation.topStart,
                      color: bannerColor,
                      child: Container(),
                    ),
                  ),
                ),
              ],
            ),
          )
        : const Scaffold(
            body: Center(
              child: Text('No internet connection'),
            ),
          ));
    // Display environment banner at top left corner
  }
}
