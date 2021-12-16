import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ThemeProviderr extends ChangeNotifier {
  ThemeMode thememode = ThemeMode.system;

  // double myContainerSize = 4000;

  bool get isDarkMode {
    if (thememode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance!.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return thememode == ThemeMode.dark;
    }
  }

  void toggleTheme(bool isOn) {
    thememode = isOn ? ThemeMode.dark : ThemeMode.light;
    // animateContainer();
    notifyListeners();
  }

  double widthh = 20;
  double heightt = 20;
  Color colorr = Colors.black;
  BorderRadiusGeometry borderRadiuss = BorderRadius.circular(8);
  bool isAnim = false;

  void animateContainer(BuildContext con) {
    widthh = isAnim ? MediaQuery.of(con).size.width * 3 : 20;
    heightt = isAnim ? MediaQuery.of(con).size.height * 3 : 20;
    colorr = Colors.black;
    print(isAnim);
    notifyListeners();
  }

  notifyListeners();
}

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    primaryColor: Colors.black,
    colorScheme: ColorScheme.dark(),
    bottomAppBarColor: Colors.black38,
    errorColor: Colors.white,
    buttonColor: Colors.black87,
    //.withOpacity(0.2),
    backgroundColor: Colors.transparent,
    iconTheme: IconThemeData(color: Colors.purple.shade200, opacity: 0.8),
    canvasColor: Colors.white,
  );
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.white,
    colorScheme: ColorScheme.light(),
    errorColor: Colors.black,
    buttonColor: Colors.white70, //.withOpacity(0.5),
    iconTheme: IconThemeData(color: Colors.red, opacity: 0.8),
    backgroundColor: Colors.grey[400],
    bottomAppBarColor: Colors.grey[400],
    canvasColor: Colors.black,
  );
}
