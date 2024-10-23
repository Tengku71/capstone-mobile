import 'package:flutter/material.dart';
import 'package:mobile/widgets/side_menu.dart';
import '../widgets/bottom_navigation.dart';
import '../widgets/header.dart';
import '../widgets/profile_info.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isHidden1 = true;
  bool isHidden2 = true;
  bool isHidden3 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      endDrawer: SideMenu(),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 30),
        scrollDirection: Axis.vertical,
        children: [
          SizedBox(
            height: 40,
          ),
          Column(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(75),
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://picsum.photos/seed/picsum/200/300"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          ProfileInfo(),
          SizedBox(
            height: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Password Lama :",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                autocorrect: false,
                keyboardType: TextInputType.text,
                obscureText: isHidden1,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      if (isHidden1 == true) {
                        isHidden1 = false;
                      } else {
                        isHidden1 = true;
                      }
                      setState(() {});
                    },
                    icon: Icon(
                      Icons.remove_red_eye,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Password Baru :",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                autocorrect: false,
                keyboardType: TextInputType.text,
                obscureText: isHidden2,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      if (isHidden2 == true) {
                        isHidden2 = false;
                      } else {
                        isHidden2 = true;
                      }
                      setState(() {});
                    },
                    icon: Icon(
                      Icons.remove_red_eye,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Konfirmasi Password :",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                autocorrect: false,
                keyboardType: TextInputType.text,
                obscureText: isHidden3,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      if (isHidden3 == true) {
                        isHidden3 = false;
                      } else {
                        isHidden3 = true;
                      }
                      setState(() {});
                    },
                    icon: Icon(
                      Icons.remove_red_eye,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
      bottomNavigationBar: BottomNavigation(
        selectedIndex: 2,
        pageIndex: 2,
      ),
    );
  }
}
