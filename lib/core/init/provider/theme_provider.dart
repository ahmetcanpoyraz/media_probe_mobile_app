import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/color_constants.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;
}

ColorScheme _customColorScheme = ColorScheme(
  brightness: Brightness.light,
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
    primaryColor: ColorConstants.instance.deepCerulean,
    colorScheme: _customColorScheme,
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: 20.sp,
        color: ColorConstants.instance.kWhite,
      ),
      displayMedium: TextStyle(
        fontSize: 16.sp,
        color: ColorConstants.instance.kBlack,
      ),
      displaySmall: TextStyle(
        fontSize: 14.sp,
        color: ColorConstants.instance.kDarkGrey,
      ),
    ),
  );

  static final lightTheme = ThemeData(
      primaryColor: ColorConstants.instance.deepCerulean,
      colorScheme: _customColorScheme,
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: 20.sp,
          color: ColorConstants.instance.kWhite,
        ),
        displayMedium: TextStyle(
          fontSize: 16.sp,
          color: ColorConstants.instance.kBlack,
        ),
        displaySmall: TextStyle(
          fontSize: 14.sp,
          color: ColorConstants.instance.kDarkGrey,
        ),
      ));
}
