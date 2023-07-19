import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:media_probe_mobile_app/core/constants/color_constants.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCustom({
    Key? key,
    required this.title,
    this.showBackButton,
  }) : super(key: key);

  final String? title;
  final bool? showBackButton;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorConstants.instance.kGreen,
      leading: showBackButton != null && showBackButton == true
          ? InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Padding(
                  padding: EdgeInsets.all(6.0.h),
                  child: Icon(
                    Icons.arrow_back,
                    size: 30.h,
                    color: ColorConstants.instance.kWhite,
                  )),
            )
          : const SizedBox(),
      elevation: 0,
      title: title != null
          ? Center(
              child: Text(
                title!,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayLarge,
              ),
            )
          : const Text(""),
      actionsIconTheme: const IconThemeData(),
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
