import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:media_probe_mobile_app/core/constants/color_constants.dart';
import 'package:provider/provider.dart';
import '../../../core/base/base_view/base_view.dart';
import '../../core/components/global_widgets/custom_cached_network_image/custom_cached_network_image.dart';
import '../../core/models/most_popular_response_model.dart';
import 'home_viewmodel.dart';
part 'home_widgets.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: Provider.of<HomeViewModel>(context, listen: false),
      onModelReady: (model) async {
        model.setContext(context);
        await model.init();
      },
      portraitOnPageBuilder: (context, viewModel, _) => Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: HomeAppBar(viewModel: viewModel),
          body: viewModel.isLoading
              ? const Center(child: CircularProgressIndicator())
              : !viewModel.searchBoolean
                  ? ItemListWidget(
                      viewModel: viewModel,
                      list: viewModel.mostPopularList,
                    )
                  : ItemListWidget(
                      viewModel: viewModel,
                      list: viewModel.searchList,
                    )),
      landscapeOnPageBuilder: (context, viewModel, _) => const SizedBox(),
    );
  }
}
