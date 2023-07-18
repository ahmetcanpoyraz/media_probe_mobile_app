import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/color_constants.dart';

class CustomTextField extends StatelessWidget {
  final bool? obscureText;
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? isDisabled;
  final TextAlign? textAlign;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final bool readOnly;
  final String? errorText;
  final ValueChanged? onChanged;
  final FormFieldValidator? validator;
  final AutovalidateMode? autovalidateMode;
  final TextInputType? inputType;
  final TextCapitalization? capitalization;
  final bool? autoCorrect;
  final Widget? icon;
  final int? maxLength;
  final bool autoFocus;
  final double borderRadius;
  final double? height;
  final double? width;
  final int? maxLines;
  final int? minLines;
  final bool? isRequired;
  final List<TextInputFormatter>? inputFormatters;
  final Color? borderColor;
  final TextInputAction? action;
  final Function(String)? onAction;
  final bool enableSuggestions;
  final bool inlinePadding;

  const CustomTextField(
      {Key? key,
        this.obscureText,
      this.hintText,
      this.suffixIcon,
      this.textAlign,
      this.onTap,
      this.height,
      this.width,
      this.prefixIcon,
      this.icon,
      this.isDisabled,
      this.readOnly = false,
      this.controller,
      this.errorText,
      this.onChanged,
      this.validator,
      this.autovalidateMode,
      this.inputType,
      this.capitalization,
      this.maxLength,
      this.autoCorrect,
      this.borderRadius = 10,
      this.autoFocus = false,
      this.inputFormatters,
      this.maxLines,
      this.minLines,
      this.isRequired = false,
      this.borderColor,
      this.action,
      this.onAction,
      this.inlinePadding = false,
      this.enableSuggestions = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        fontSize: 14.sp,
        color: Theme.of(context).colorScheme.tertiary,
      ),
      onTap: onTap,
      controller: controller,
      onChanged: onChanged,
      textAlign: textAlign ?? TextAlign.left,
      readOnly: readOnly,
      obscureText: obscureText ?? false,
      validator: validator,
      keyboardType: inputType,
      textCapitalization: capitalization ?? TextCapitalization.none,
      autocorrect: autoCorrect ?? true,
      autovalidateMode: autovalidateMode,
      maxLength: maxLength,
      minLines: minLines,
      autofocus: autoFocus,
      enableSuggestions: enableSuggestions,
      maxLines:  maxLines ?? 1,
      textInputAction: TextInputAction.go,
      onFieldSubmitted: onAction,
      inputFormatters: inputFormatters,

      decoration: InputDecoration(
          errorMaxLines: 2,
        constraints: BoxConstraints(maxHeight: 90.h, minHeight: 50.h),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
            ),

            borderRadius: BorderRadius.circular(5.sp)),

        contentPadding: inlinePadding
            ? EdgeInsets.only(top: 0.sp, left: 10.sp, right: 0.sp,bottom: 0)
            : EdgeInsets.only(top: 0.sp, left: 10.sp,bottom: 0),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.sp),
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        fillColor: Colors.white,
        filled: true,
        hintText: isRequired! ? '$hintText *' : hintText,
        hintStyle: Theme.of(context).textTheme.subtitle1!.copyWith(color: ColorConstants.instance.kBlack.withOpacity(0.5)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.sp),
        ),
        errorText: errorText,
        errorStyle: TextStyle(
            fontSize: 12.sp,
            color:Theme.of(context).errorColor
          // height: 1.sp
        ),
      ),
    );
  }
}
