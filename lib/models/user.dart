class User {
  String _nama = "";
  String _tanggallahir = "";
  String _tempatlahir = "";
  String _alamat = "";
  String _email = "";
  String _pass = "";

  String get nama => _nama;
  String get tanggallahir => _tanggallahir;
  String get tempatlahir => _tempatlahir;
  String get alamat => _alamat;
  String get email => _email;
  String get pass => _pass;

  set nama(String nama) {
    _nama = nama;
  }
  set tanggallahir(String tanggallahir) {
    _tanggallahir = tanggallahir;
  }
  set tempatlahir(String tempatlahir) {
    _tempatlahir = tempatlahir;
  }
  set alamat(String alamat) {
    _alamat = alamat;
  }
  set email(String email) {
    _email = email;
  }
  set pass(String pass) {
    _pass = pass;
  }

}
