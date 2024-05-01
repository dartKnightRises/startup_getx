import 'package:startup_getx/common_libs.dart';

class AppColors {
  /// Common
  final Color accent1 = const Color(0xff1f282e); //primary
  final Color accent2 = const Color(0xff008080); //secondary
  final Color offWhite = Colors.white70;
  final Color caption = const Color(0xFF7D7873);
  final Color body = const Color(0xFF514F4D);
  final Color greyStrong = const Color(0xFF272625);
  final Color greyMedium = const Color(0xFF9D9995);
  final Color white = Colors.white;
  final Color black = const Color(0xFF1E1B18);
  final Color appBlue = const Color(0xff6c63fb);
  final Color appVibrantBlue = const Color(0xff007fff);
  final Color appTealSecondary = const Color(0xff008080);
  final Color appCharcoalPrimary = const Color(0xff36454f);
  final Color appDarkCharcoalPrimary = const Color(0xff1f282e);
  final Color appGreyTertiary = const Color(0xffd3d3d3);


  // Flavor color
  final Color devBanner = Colors.green;
  final Color sitBanner = Colors.amber;
  final Color prodBanner = Colors.red;




  // final bool isDark = false;

  ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(fontSize: 18, color: Colors.black87),
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.blue,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff007fff)),
  );

  ThemeData darkTheme = ThemeData(
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(fontSize: 18, color: Colors.white70),
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.red,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xff008080),
      brightness: Brightness.dark,
    ),
  );
}
