import 'package:flutter/material.dart';
import 'package:mobile/models/hasil.dart';
import 'package:mobile/widgets/side_menu.dart';
import '../widgets/bottom_navigation.dart';
import '../widgets/header.dart';
import '../widgets/btn_unggah.dart';
import '../widgets/btn_deteksi.dart';
import '../widgets/warning.dart';
import '../widgets/hasil_deteksi.dart';

class CekKesehatanMata extends StatefulWidget {
  @override
  _CekKesehatanMataState createState() => _CekKesehatanMataState();
}

class _CekKesehatanMataState extends State<CekKesehatanMata> {
  Hasil hasil = Hasil();
  bool _isHasilVisible = false; // Add a boolean to control visibility

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      endDrawer: SideMenu(),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          SizedBox(height: 30),
          Center(
            child: Text(
              "Upload dan Deteksi",
              style: TextStyle(
                color: Color.fromRGBO(54, 91, 109, 1),
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
          Warning(),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Unggah Gambar",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 10),
                      BtnUnggah(),
                      SizedBox(height: 10),
                      Text("    Format: PNG, JPG atau JPEG"),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                BtnDeteksi(onDetect: () {}

                    // onDetect: () async {
                    //       hasil.gambar_mata =
                    //       var response = await http.post(
                    //           Uri.parse("${ApiService().baseUrl}api/user/login/"),
                    //           headers: {'Content-Type': 'application/json'},
                    //           body: jsonEncode(
                    //               {"email": user.email, "password": user.pass}));

                    //       Map<String, dynamic> data =
                    //           jsonDecode(response.body) as Map<String, dynamic>;

                    //       if (response.statusCode == 200) {
                    //         // Success: update the global status
                    //         Status().isLogin = true;

                    //         // Navigate to the home page
                    //         Navigator.pushReplacement(
                    //           context,
                    //           MaterialPageRoute(
                    //               builder: (context) => const Home()),
                    //         );
                    //         ScaffoldMessenger.of(context).showSnackBar(
                    //           SnackBar(
                    //             backgroundColor: Colors.black,
                    //             content: Text(
                    //               'Berhasil Login',
                    //               style: TextStyle(color: Colors.white),
                    //             ),
                    //             action: SnackBarAction(
                    //               label: "Close",
                    //               onPressed: () {},
                    //               textColor: Colors.white,
                    //             ),
                    //             duration: const Duration(seconds: 2),
                    //           ),
                    //         );
                    //       } else {
                    //         print(data);
                    //         // Failure: show the error message
                    //         ScaffoldMessenger.of(context).showSnackBar(
                    //           SnackBar(
                    //             backgroundColor: Colors.red,
                    //             content: Text(
                    //                 'Error: ${data["message"] ?? "Unknown error occurred"}'),
                    //             action: SnackBarAction(
                    //               label: "Close",
                    //               onPressed: () {},
                    //               textColor: Colors.black,
                    //             ),
                    //             duration: const Duration(seconds: 2),
                    //           ),
                    //         );, // Pass the detection callback
                    ),
              ],
            ),
          ),
          SizedBox(height: 20),
          // Only show HasilDeteksi if _isHasilVisible is true
          if (_isHasilVisible)
            HasilDeteksi(
              gambar_mata: hasil.gambar_mata,
              hasil_deteksi: hasil.hasil_deteksi,
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
