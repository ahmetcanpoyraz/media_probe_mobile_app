import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/base/base_view/base_view.dart';
import 'detail_viewmodel.dart';

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
      portraitOnPageBuilder: (context, viewModel, _) => const Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Text("detail"))

      ),
      landscapeOnPageBuilder: (context, viewModel, _) => const SizedBox(),
    );
  }
}
