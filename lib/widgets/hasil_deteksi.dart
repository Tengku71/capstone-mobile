import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/widgets/btn_hubungi_dokter.dart';
import 'package:mobile/widgets/btn_cek_profile.dart';

class HasilDeteksi extends StatelessWidget {
  String gambar_mata;
  String hasil_deteksi;

  HasilDeteksi({super.key, required this.gambar_mata, required this.hasil_deteksi});

  @override
  Widget build(BuildContext context) {
    switch (hasil_deteksi) {
      case "normal":
        return Normal(
          img: gambar_mata,
        );
      case "unknown":
        return BukanMata(
          img: gambar_mata,
        );
      default:
        return Penyakit(
          img: gambar_mata,
          deteksi: hasil_deteksi,
        );
    }
  }
}

class Normal extends StatelessWidget {
  String img;

  Normal({super.key, required this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromRGBO(227, 255, 253, 1),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'assets/icons/svg/warning.svg',
                  color: const Color.fromRGBO(65, 193, 186, 1),
                  width: 25.0,
                  height: 25.0,
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'Alhamdulillah... ',
                          style: TextStyle(
                            color: Color.fromRGBO(54, 91, 109, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        TextSpan(
                          text:
                              'mata anda normal, tetap jaga mata kesehatan mata anda!',
                          style: TextStyle(
                            color: Color.fromRGBO(54, 91, 109, 1),
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Image(
                  image: NetworkImage(img),
                  fit: BoxFit.cover,
                  width: 90,
                  height: 70,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Penyakit extends StatelessWidget {
  String img;
  String deteksi;

  Penyakit({super.key, required this.img, required this.deteksi});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromRGBO(246, 185, 185, 1),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'assets/icons/svg/warning.svg',
                  color: Colors.red,
                  width: 25.0,
                  height: 25.0,
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Astagfirllah... ',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        TextSpan(
                          text: 'Hasil deteksi $deteksi',
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Image(
                  image: NetworkImage(img),
                  fit: BoxFit.cover,
                  width: 90,
                  height: 70,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromRGBO(213, 255, 195, 1),
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/svg/warning.svg',
                      color: const Color.fromRGBO(70, 185, 0, 1),
                      width: 25.0,
                      height: 25.0,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: 'Rekomendasi... ',
                              style: TextStyle(
                                color: Color.fromRGBO(7, 246, 2, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            TextSpan(
                              text: 'Disarankan hubungi dokter dibawah ',
                              style: TextStyle(
                                color: Color.fromRGBO(7, 246, 2, 1),
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image(
                                image: NetworkImage(img),
                                fit: BoxFit.cover,
                                width: 90,
                                height: 70,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                'Dr Rafi Muhammad',
                                style: TextStyle(
                                  color: Color.fromRGBO(70, 185, 0, 1),
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  children: [
                    BtnCekProfile(),
                    SizedBox(
                      width: 20,
                    ),
                    BtnHubungiDokter(),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}

class BukanMata extends StatelessWidget {
  String img;

  BukanMata({super.key, 
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromRGBO(247, 242, 195, 1),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'assets/icons/svg/warning.svg',
                  color: const Color.fromRGBO(185, 178, 0, 1),
                  width: 25.0,
                  height: 25.0,
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'Data tidak diketahui',
                          style: TextStyle(
                            color: Color.fromRGBO(185, 178, 0, 1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Image(
                  image: NetworkImage(img),
                  fit: BoxFit.cover,
                  width: 90,
                  height: 70,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
