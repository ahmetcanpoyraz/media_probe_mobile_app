import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';

import '../../../constants/color_constants.dart';
import '../../../init/provider/theme_provider.dart';

class AppBarHome extends StatelessWidget implements PreferredSizeWidget {
  const AppBarHome({
    Key? key,
    required this.title,
    required this.showAppBar,
    this.onTap,
  }) : super(key: key);

  final String? title;
  final bool showAppBar;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.background,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: context.watch<ThemeProvider>().isDarkMode
            ? Colors.white
            : ColorConstants.instance.alabaster, // Status bar
      ),
      automaticallyImplyLeading: true,
      leading: IconButton(
          onPressed: () {
            onTap!();
          },
          icon: Icon(
            Icons.menu,
            size: 20.h,
          )),
      elevation: 0,
      actions: [
        IconButton(
          icon: Icon(
            Icons.info,
            size: 20.h,
          ),
          onPressed: () {},
        ),
      ],
      title: title != null
          ? Center(
              child: Text(
                title!,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline1,
              ),
            )
          : const Text("Dider"),
      centerTitle: true,
      toolbarHeight: 40.sp,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(40.0.sp);
}
