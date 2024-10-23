import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile/models/api.dart';
import 'package:mobile/models/user.dart';
import 'package:mobile/pages/login.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isHidden1 = true;
  bool isHidden2 = true;

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1700),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        tanggallahirC.text =
            DateFormat('yyyy-MM-dd').format(picked); // Format the date
      });
    }
  }

  TextEditingController namaC = TextEditingController();
  TextEditingController tanggallahirC = TextEditingController();
  TextEditingController tempatlahirC = TextEditingController();
  TextEditingController alamatC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  TextEditingController konfirmpassC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(227, 255, 253, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(227, 255, 253, 1),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Eye",
                    style: TextStyle(
                        color: Color.fromRGBO(65, 193, 186, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
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
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    TextField(
                      controller: namaC,
                      autocorrect: false,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        labelText: "Nama",
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // Row for Birthplace and DatePicker
                    Row(
                      children: [
                        // Expanded for Birthplace field
                        Expanded(
                          child: TextField(
                            controller: tempatlahirC,
                            decoration: const InputDecoration(
                              labelText: "Tempat Lahir", // Birthplace
                            ),
                            autocorrect: false,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                        const SizedBox(width: 10), // Space between fields
                        // Expanded for Date Picker
                        Expanded(
                          child: TextField(
                            controller: tanggallahirC,
                            decoration: const InputDecoration(
                              labelText: "Tanggal Lahir", // Date of Birth
                            ),
                            readOnly: true,
                            onTap: () {
                              _selectDate(); // Open date picker on tap
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: alamatC,
                      autocorrect: false,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        labelText: "Alamat",
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: emailC,
                      autocorrect: false,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        labelText: "Email",
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: passC,
                      autocorrect: false,
                      keyboardType: TextInputType.text,
                      obscureText: isHidden1,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        labelText: "Password",
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isHidden1 = !isHidden1;
                            });
                          },
                          icon: Icon(
                            isHidden1
                                ? Icons.remove_red_eye
                                : Icons.visibility_off,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: konfirmpassC,
                      autocorrect: false,
                      keyboardType: TextInputType.text,
                      obscureText: isHidden2,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        labelText: "Konfirmasi Password",
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isHidden2 = !isHidden2;
                            });
                          },
                          icon: Icon(
                            isHidden2
                                ? Icons.remove_red_eye
                                : Icons.visibility_off,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        User newUser = User();
                        newUser.nama = namaC.text.toString();
                        newUser.alamat = alamatC.text.toString();
                        newUser.tanggallahir = tanggallahirC.text.toString();
                        newUser.tempatlahir = tempatlahirC.text.toString();
                        newUser.email = emailC.text.toString();
                        newUser.pass = passC.text.hashCode.toString();
                        var respons = await http.post(
                            Uri.parse(
                                "${ApiService().baseUrl}/api/user/create"),
                            headers: {'Content-Type': 'application/json'},
                            body: jsonEncode({
                              "nama": newUser.nama,
                              "alamat": newUser.alamat,
                              "tanggal_lahir": newUser.tanggallahir,
                              "tempat_lahir": newUser.tempatlahir,
                              "email": newUser.email,
                              "password": newUser.pass
                            }));

                        Map<String, dynamic> data =
                            jsonDecode(respons.body) as Map<String, dynamic>;
                        if (passC.text != konfirmpassC) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.black,
                              content:
                                  const Text("Konfirmasi Password tidak sama!"),
                              action: SnackBarAction(
                                label: "Close",
                                onPressed: () {},
                                textColor: Colors.red,
                              ),
                              duration: const Duration(seconds: 2),
                            ),
                          );
                          print(data);
                        } else if (respons.statusCode == 200) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.red,
                              content: Text(
                                  'Error: ${data["message"] ?? "Unknown error occurred"}'),
                              action: SnackBarAction(
                                label: "Close",
                                onPressed: () {},
                                textColor: Colors.black,
                              ),
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                      ),
                      child: const Text(
                        "Daftar",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Sudah punya akun?",
                          style: TextStyle(),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                            );
                          },
                          child: Text(
                            "Masuk",
                            style: TextStyle(
                              color: Colors.blue[300],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
