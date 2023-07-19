import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:media_probe_mobile_app/core/constants/color_constants.dart';
import 'package:media_probe_mobile_app/views/splash/splash_viewmodel.dart';
import 'package:provider/provider.dart';
import '../../../core/base/base_view/base_view.dart';
part 'splash_widgets.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewModel>(
      viewModel: Provider.of<SplashViewModel>(context, listen: false),
      onModelReady: (model) async {
        model.setContext(context);
        await model.init();
      },
      portraitOnPageBuilder: (context, viewModel, _) => Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Icon(
          Icons.ac_unit,
          size: 250.h,
          color: ColorConstants.instance.kPrussianBlue,
        )),
      ),
      landscapeOnPageBuilder: (context, viewModel, _) => const SizedBox(),
    );
  }
}
