class Hasil {
  String _hasil_deteksi = "normal";
  String _gambar_mata = "Choose File";
  String _dokter = "https://picsum.photos/seed/picsum/200/300";

  String get hasil_deteksi => _hasil_deteksi;
  String get gambar_mata => _gambar_mata;
  String get dokter => _dokter;

  set hasil_deteksi(String hasil_deteksi) {
    _hasil_deteksi = hasil_deteksi;
  }

  set gambar_mata(String gambar_mata) {
    _gambar_mata = gambar_mata;
  }
}
