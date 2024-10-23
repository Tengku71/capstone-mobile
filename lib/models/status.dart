class Status {
  static final Status _instance = Status._internal();

  factory Status() {
    return _instance;
  }

  Status._internal();

  bool _isLogin = false;

  set isLogin(bool isLogin) {
    _isLogin = isLogin;
  }

  bool get isLogin => _isLogin;
}
