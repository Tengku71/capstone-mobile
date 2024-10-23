import 'package:flutter/material.dart';
import 'package:mobile/widgets/side_menu.dart';
import '../widgets/bottom_navigation.dart';
import '../widgets/header.dart';
import '../widgets/developer.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      endDrawer: SideMenu(),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 30), //padding kanan-kiri
        scrollDirection: Axis.vertical,
        children: [
          SizedBox(
            height: 40,
          ),
          Center(
            child: Text(
              "MATA SEHAT, MASA DEPAN CERAH",
              style: TextStyle(
                color: Color.fromRGBO(51, 145, 255, 1),
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 50),
            child: Center(
              child: Text(
                "Menuju Teknologi yang lebih baik di masa depan",
                style: TextStyle(
                  color: Color.fromRGBO(54, 91, 109, 1),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Image.asset("assets/img/about.png"), //gambar 
          SizedBox(
            height: 10, //spasi
          ),
          Text(
            "Mengoptimalkan Kesejahteraan dengan Inovasi Deteksi Kesehatan Mata",
            style: TextStyle(
              color: Color.fromRGBO(65, 183, 186, 1),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Penyakit mata, seperti katarak, glaukoma, dan retinopati diabetik, merupakan penyebab utama gangguan penglihatan dan kebutaan di dunia, dengan lebih dari 2,2 miliar orang terdampak. Keterlambatan diagnosis, kurangnya akses ke tenaga medis spesialis, serta rendahnya kesadaran masyarakat memperparah situasi ini, terutama di daerah terpencil. Di era digital, teknologi berbasis kecerdasan buatan dan telemedicine menjadi solusi efektif untuk deteksi dini penyakit mata, sehingga dapat menurunkan angka kebutaan dan meningkatkan kualitas hidup masyarakat.",
            style: TextStyle(
              color: Color.fromRGBO(54, 91, 109, 1),
              fontSize: 18,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Center(
            child: Text(
              "Development",
              style: TextStyle(
                color: Color.fromRGBO(51, 145, 255, 1),
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Developer(),
          SizedBox(
            height: 40,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigation(
        selectedIndex: 0,
        pageIndex: 10,
      ),
    );
  }
}
