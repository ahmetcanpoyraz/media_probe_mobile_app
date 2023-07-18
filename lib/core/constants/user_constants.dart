class UserConstant {
  static UserConstant? _instance;
  static UserConstant? get instance {
    _instance ??= UserConstant._init();
    return _instance;
  }

  UserConstant._init();
  int userId = 0;
  String phoneNumber = "";
  String name = "";
  String email = "";
}
