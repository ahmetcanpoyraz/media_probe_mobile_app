import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:media_probe_mobile_app/core/constants/color_constants.dart';
import 'package:provider/provider.dart';
import '../../../core/base/base_view/base_view.dart';
import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: Provider.of<HomeViewModel>(context, listen: false),
      onModelReady: (model) async {
        model.setContext(context);
        await model.init();
      },
      portraitOnPageBuilder: (context, viewModel, _) => const Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Text("home"))
      ),
      landscapeOnPageBuilder: (context, viewModel, _) => const SizedBox(),
    );
  }
}
