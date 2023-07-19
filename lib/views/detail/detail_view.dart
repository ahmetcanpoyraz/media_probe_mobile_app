import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:provider/provider.dart';
import '../../../core/base/base_view/base_view.dart';
import '../../core/components/global_widgets/appBar/custom_app_bar.dart';
import 'detail_viewmodel.dart';
part 'detail_widgets.dart';

class DetailView extends StatelessWidget {
  const DetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<DetailViewModel>(
      viewModel: Provider.of<DetailViewModel>(context, listen: false),
      onModelReady: (model) async {
        model.setContext(context);
        await model.init();
      },
      portraitOnPageBuilder: (context, viewModel, _) => Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: const AppBarCustom(
            title: "Detail",
            showBackButton: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  HtmlWidget(
                    viewModel.htmlContent!,
                  ),
                ],
              ),
            ),
          )),
      landscapeOnPageBuilder: (context, viewModel, _) => const SizedBox(),
    );
  }
}
