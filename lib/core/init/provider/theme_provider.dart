import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/color_constants.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}


ColorScheme _customColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: ColorConstants.instance.deepCerulean,
  onPrimary: ColorConstants.instance.kGeyser,
  secondary: ColorConstants.instance.kPrussianBlue,
  //
  outline: ColorConstants.instance.kSinbad,
  onSecondary: ColorConstants.instance.kBermuda,
  error: ColorConstants.instance.kRed,
  onError: ColorConstants.instance.kBrickRed,
  background: ColorConstants.instance.alabaster,
  onBackground: ColorConstants.instance.kPrussianBlue,
  surface: ColorConstants.instance.deepCerulean,
  onSurface: ColorConstants.instance.kChathamsBlue,
  tertiary: ColorConstants.instance.kMineShaft,
);

class MyThemes {
  static final darkTheme = ThemeData(
    primarySwatch: Colors.red,
    scaffoldBackgroundColor: ColorConstants.instance.alabaster,
    colorScheme: _customColorScheme,
    iconTheme:
        IconThemeData(color: ColorConstants.instance.kBermuda, opacity: 0.8),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 20.sp,
        color: ColorConstants.instance.kMineShaft,
        fontWeight: FontWeight.w700,
        //height: 1.2.sp,
      ),
      headline2: TextStyle(
        fontSize: 16.sp,
        color: ColorConstants.instance.kGeyser,
        fontWeight: FontWeight.w600,
      ),
      headline3: TextStyle(
        fontSize: 16.sp,
        color: ColorConstants.instance.kPrussianBlue,
        fontWeight: FontWeight.w600,
      ),
    ),
  );

  static final lightTheme = ThemeData(
    primaryColor: ColorConstants.instance.deepCerulean,
      scaffoldBackgroundColor: ColorConstants.instance.kPrussianBlue,
      colorScheme: _customColorScheme,
      iconTheme: const IconThemeData(color: Colors.red, opacity: 0.8),
      textTheme: TextTheme(
        headline1: TextStyle(
          fontSize: 20.sp,
          color: ColorConstants.instance.kMineShaft,
          fontWeight: FontWeight.w700,
        ),
        headline2: TextStyle(
          fontSize: 18.sp,
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
        headline3: TextStyle(
            fontSize: 16.sp,
            color: ColorConstants.instance.kGeyser,
            fontWeight: FontWeight.w600,
            height: 1.2.sp),
        headline4: TextStyle(
          fontSize: 16.sp,
          color: ColorConstants.instance.kPrussianBlue,
          fontWeight: FontWeight.w600,
        ),
        headline5: TextStyle(
          fontSize: 14.sp,
          color: const Color(0xffF9F9F9),
          fontWeight: FontWeight.w500,
        ),
        headline6: TextStyle(
          fontSize: 12.sp,
          color: const Color(0xff9AD1D4),
          fontWeight: FontWeight.w500,
        ),
        subtitle1: TextStyle(
          fontSize: 14.sp,
          color: ColorConstants.instance.kPrussianBlue,
          fontWeight: FontWeight.w600,
        ),
        subtitle2: TextStyle(
          fontSize: 16.sp,
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
        bodyText1:
        TextStyle(
          fontSize: 12.sp,
          color: ColorConstants.instance.kPrussianBlue,
          fontWeight: FontWeight.w500,
        ),
        bodyText2:
        TextStyle(
          fontSize: 10.sp,
          color: ColorConstants.instance.kDarkGrey,
          fontWeight: FontWeight.w600,
        ),
      ));
}
