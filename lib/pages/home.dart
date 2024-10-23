import 'package:flutter/material.dart';
import 'package:mobile/pages/chabot.dart';
import '../widgets/header.dart';
import '../widgets/bottom_navigation.dart';
import '../widgets/btn_cek_kesehatan_mata.dart';
import '../widgets/side_menu.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      endDrawer: SideMenu(),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 25),
        scrollDirection: Axis.vertical,
        children: [
          SizedBox(
            height: 50,
          ),
          SizedBox(
            height: 250,
            child: Image.asset(
              "assets/img/home.png",
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                "Eye",
                style: TextStyle(
                  color: Color.fromRGBO(54, 91, 109, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Health",
                style: TextStyle(
                  color: Color.fromRGBO(54, 91, 109, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 60,
          ),
          Text(
            "Menjaga kesehatan mata adalah hal paling utama karena mata adalah salah satu organ dalam tubuh yang sangat penting dalam melakukan aktivitas sehari - hari, ayoo!! kita jaga kesehatan mata kita dengan Gizi dan aktivitas yang cukup !!",
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              btn_cek_kesehatan_mata(),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => ChatbotPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/icons/mage_robot-happy.png',
                      width: 24,
                      height: 24,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Chatbot',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigation(
        selectedIndex: 0,
        pageIndex: 0,
      ),
    );
  }
}
