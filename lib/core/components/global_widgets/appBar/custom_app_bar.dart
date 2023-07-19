import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCustom({
    Key? key,
    required this.title,
    this.showBackButton,
    this.openDrawerAgain,
    this.onTap,
  }) : super(key: key);

  final String? title;
  final bool? showBackButton;
  final bool? openDrawerAgain;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: showBackButton != null && showBackButton == true
          ? InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Padding(
                  padding: EdgeInsets.all(6.0.sp),
                  child: const Icon(Icons.arrow_circle_left_sharp)),
            )
          : SizedBox(),
      elevation: 0,
      title: title != null
          ? Center(
              child: Text(
                title!,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline1,
              ),
            )
          : const Text(""),
      actionsIconTheme: IconThemeData(),
      actions: [
        SizedBox(
          width: 40.w,
        )
      ],
      centerTitle: true,
      toolbarHeight: 40.sp,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(40.0.sp);
}
