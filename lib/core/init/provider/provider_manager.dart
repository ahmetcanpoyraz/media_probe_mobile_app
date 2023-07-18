import 'package:media_probe_mobile_app/views/detail/detail_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../../../views/home/home_viewmodel.dart';
import '../../../views/splash/splash_viewmodel.dart';

class ProviderManager {
  static ProviderManager? _instance;
  static ProviderManager get instance {
    _instance ??= ProviderManager._init();
    return _instance!;
  }

  ProviderManager._init();

  List<SingleChildWidget> singleProvider = [
    ChangeNotifierProvider<HomeViewModel>(
      create: (_) => HomeViewModel(),
    ),
    ChangeNotifierProvider<SplashViewModel>(
      create: (_) => SplashViewModel(),
    ),
    ChangeNotifierProvider<DetailViewModel>(
      create: (_) => DetailViewModel(),
    ),
  ];
}
