// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../buttons/button.dart';

class CustomAlertDialog extends StatelessWidget {

  final Widget? content;
  final String? buttonText;
  EdgeInsetsGeometry? contentPadding;
  Function()? onButtonPressed;
  CustomAlertDialog(
      {Key? key,
      this.content,
        this.contentPadding,
      this.buttonText,
      this.onButtonPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: contentPadding ?? EdgeInsets.only(left: 25.w,right: 25.w,top: 25.h,bottom: 5.h),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.sp))),
      content: content,
      backgroundColor: Colors.white,
      actionsAlignment: MainAxisAlignment.center,
      actionsPadding: EdgeInsets.symmetric(horizontal: 40.w,vertical: 20.w),
      actions: <Widget>[
            CustomButton(
              height: 40.h,
              isActive: true,
              text: buttonText,
              textStyle: Theme.of(context).textTheme.headline1,
              onPressed: onButtonPressed!,
              width: double.infinity,
            )
      ],
    );
  }
}
