// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constants/color_constants.dart';

class CustomButtonWithIcon extends StatelessWidget {
  bool? isActive;
  String? text;
  Function()? onPressed;
  TextStyle? textStyle;
  IconData? icon;
  CustomButtonWithIcon(
      {Key? key,
      this.isActive,
      this.text,
      this.onPressed,
      this.textStyle,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon),
            SizedBox(
              width: 10.w,
            ),
            Text(
              text!,
              style: textStyle,
            ),
          ],
        ),
        style: ElevatedButton.styleFrom(
            fixedSize: Size(140.w, 40.h),
            primary: isActive!
                ? ColorConstants.instance.kBlue
                : ColorConstants.instance.kWhite));
  }
}

// Widget buttonWithIcon(bool? isActive, String text, Function()? onPressed,
//     TextStyle? textStyle, IconData? icon) {
//   return ElevatedButton(
//       onPressed: onPressed,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Icon(icon),
//           SizedBox(
//             width: 10.w,
//           ),
//           Text(
//             text,
//             style: textStyle,
//           ),
//         ],
//       ),
//       style: ElevatedButton.styleFrom(
//           fixedSize: Size(140.w, 40.h),
//           primary: isActive!
//               ? ColorConstants.instance.kBlue
//               : ColorConstants.instance.kLightGrey));
// }


/* 
NASIL KULLANILIR? 

  * buttonWithIcon(

      *Aktif buton mu Pasif buton mu olacağını belirleyen TRUE ya da FALSE değerini veriyoruz
      *Butonun içinde görünecek yazıyı veriyoruz
      *OnPress metodu ile butona basılınca yapılmasını istediğimiz işlemi gönderiyoruz
      *texyStyle ile butonun içinde görünen yazının stilini ve rengini belirliyoruz
      *icon ile buton üzerinde görüncek ikonu seçiyorux

      ÖRNEK:

      longButton(
                false, => AKTİF Mİ DEĞİL Mİ
                'deneme', => BUTON YAZISI
                () {}, => ONPRESS METODU
                AppTextStyle().getLoginButtonTextStyle(context, Colors.red), => BUTON YAZI STİLİ
                Icons.plus_one => İKON
              )
  )

*/