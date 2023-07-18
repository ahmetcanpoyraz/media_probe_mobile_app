import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/design_size.dart';

class OrientationPage extends StatelessWidget {
  const OrientationPage(
      {Key? key, required this.portraitPage, required this.landspacePage})
      : super(key: key);

  final Widget portraitPage;
  final Widget landspacePage;

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait
        ? ScreenUtilInit(
            designSize: AppDesignSize.portraitDesignSize,
            builder: (context, child) {
              return portraitPage;
            },
          )
        : ScreenUtilInit(
            designSize: AppDesignSize.landspaceDesignSize,
            builder: (context, child) {
              return landspacePage;
            },
          );
  }
}
