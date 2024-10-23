class ApiService {
  // String _baseUrl = 'http://10.0.2.2:5000/';
  String _baseUrl = 'https://eyehealth.pythonanywhere.com/';
  final String _header = "{'Content-Type': 'application/json'}";

  String get baseUrl => _baseUrl;
  String get header => _header;

  set baseUrl(String url) {
    _baseUrl = url;
  }
}
