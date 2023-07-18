// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constants/color_constants.dart';

class CustomLongButton extends StatelessWidget {
  bool? isActive;
  String? text;
  Function()? onPressed;
  TextStyle? textStyle;
  Size? size;
  CustomLongButton(
      {Key? key,
      this.isActive,
      this.text,
      this.onPressed,
      this.textStyle,
      this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text!,
          style: textStyle,
        ),
        style: ElevatedButton.styleFrom(
            fixedSize: size ?? Size(255.w, 40.h),
            primary: isActive!
                ? ColorConstants.instance.kBlue
                : ColorConstants.instance.kLinkWater));
  }
}

// Widget longButton(
//     bool? isActive, String text, Function()? onPressed, TextStyle? textStyle) {
//   return ElevatedButton(
//       onPressed: onPressed,
//       child: Text(
//         text,
//         style: textStyle,
//       ),
//       style: ElevatedButton.styleFrom(
//           fixedSize: Size(255.w, 40.h),
//           primary: isActive!
//               ? ColorConstants.instance.kBlue
//               : ColorConstants.instance.kLightGrey));
// }


/* 
NASIL KULLANILIR? 

  * longButton(

      *Aktif buton mu Pasif buton mu olacağını belirleyen TRUE ya da FALSE değerini veriyoruz
      *Butonun içinde görünecek yazıyı veriyoruz
      *OnPress metodu ile butona basılınca yapılmasını istediğimiz işlemi gönderiyoruz
      *texyStyle ile butonun içinde görünen yazının stilini ve rengini belirliyoruz

      ÖRNEK:

      longButton(
                false, => AKTİF Mİ DEĞİL Mİ
                'deneme', => BUTON YAZISI
                () {}, => ONPRESS METODU
                AppTextStyle().getLoginButtonTextStyle(context, Colors.red), => BUTON YAZI STİLİ
              )
  )

*/