import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../constants/color_constants.dart';
import '../../../init/provider/theme_provider.dart';

class ChangeThemeButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Switch.adaptive(
      value: themeProvider.isDarkMode,
      activeColor: ColorConstants.instance.kGeyser,
      onChanged: (value) {
        Provider.of<ThemeProvider>(context, listen: false).toggleTheme(value);
        //   final provider = Provider.of<ThemeProvider>(context, listen: false);
        //  provider.toggleTheme(value);
      },
    );
  }
}
