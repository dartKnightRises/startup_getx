import 'package:startup_getx/common_libs.dart';


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  // Index to track the current page
  int _currentPageIndex = 0;

  // Dummy data for onboarding pages
  List<String> onboardingPages = [
    'Onboarding Page 1',
    'Onboarding Page 2',
    'Onboarding Page 3',
  ];

  void _onCompleteOnboarding() {
    // Call markFirstTimeShown to update the flag in AppLogic
    AppLogic appLogic = Get.find<AppLogic>(); // Get reference to AppLogic
    appLogic.markFirstTimeShown(); // Mark onboarding as shown

    // Navigate to the main screen of your application
    Get.offAllNamed(Routes.homeScreen); // Assuming Routes.homeScreen is the main screen route
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            // Container for onboarding content (top 95%)
            Expanded(
              flex: 14,
              child: Container(
                color: Colors.blue,
                child: Center(
                  child: Text(
                    onboardingPages[_currentPageIndex],
                    style: const TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ),
            ),
            // Bottom 5% containing dot indicator and navigation arrows
            Expanded(
              flex: 1,
             child:
             GestureDetector(
               onTap: () {
                 if(_currentPageIndex==2){
                   _onCompleteOnboarding();
                 }

                 if (_currentPageIndex+1 < onboardingPages.length) {
                   setState(() {
                     _currentPageIndex++;
                   });
                 }
               },
               child: SizedBox(
                 width: 55,

                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child:
                   Stack(
                     children: [
                       // Forward icon button
                       const Positioned.fill(
                         child: Center(
                           child: Icon(Icons.arrow_forward, color: Colors.blue, size: 25),
                         ),
                       ),
                       // Circular progress border
                       Positioned.fill(
                         child: CircularProgressIndicator(
                           value: (_currentPageIndex + 1) / onboardingPages.length,
                           valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                           strokeWidth: 4,
                           backgroundColor: Colors.white,
                         ),
                       ),
                     ],
                   ),
                 ),
               ),
             ),
            ),
          ],
        ),
      ),
    );
  }

  // Method to change the current page index
  void _changePage(int increment) {
    setState(() {
      _currentPageIndex += increment;
    });
  }
}
