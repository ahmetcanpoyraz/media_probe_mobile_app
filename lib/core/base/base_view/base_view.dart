import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../components/changeOrientation/orientation_page.dart';
import '../base_viewmodel/base_viewmodel.dart';

class BaseView<T extends BaseViewModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T value, Widget?)
      portraitOnPageBuilder;
  final Widget Function(BuildContext context, T value, Widget?)
      landscapeOnPageBuilder;
  final T viewModel;
  final Function(T model) onModelReady;
  const BaseView(
      {Key? key,
      required this.portraitOnPageBuilder,
      required this.landscapeOnPageBuilder,
      required this.viewModel,
      required this.onModelReady})
      : super(key: key);

  @override
  _BaseViewState createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  late T model;

  @override
  void initState() {
    model = widget.viewModel;
    widget.onModelReady(model);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: model,
      child: Consumer<T>(
        builder: (context, model, Widget? child) => model.isLoading
            ? const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : OrientationPage(
                portraitPage:
                    widget.portraitOnPageBuilder(context, model, child),
                landspacePage:
                    widget.landscapeOnPageBuilder(context, model, child),
              ),
      ),
    );
  }
}
