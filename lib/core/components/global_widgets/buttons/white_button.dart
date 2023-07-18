// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomWhiteButton extends StatelessWidget {
  bool? isActive;
  String? text;
  double? width;
  double? height;
  Function()? onPressed;
  TextStyle? textStyle;
  CustomWhiteButton({
    Key? key,
    this.isActive,
    this.onPressed,
    this.text,
    this.height,
    this.textStyle,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text!,
        style: Theme.of(context)
            .textTheme
            .subtitle2
            ?.copyWith(color: Theme.of(context).colorScheme.secondary),
      ),
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all<Size>(
            Size(width ?? 240.w, height ?? 36.h)),
        elevation: MaterialStateProperty.all<double>(0.0),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        side: MaterialStateProperty.all<BorderSide>(
          BorderSide(color: Theme.of(context).colorScheme.secondary),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0.sp),
          ),
        ),
      ),
    );
  }
}
