import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mobile/models/api.dart';
import 'package:mobile/models/status.dart';
import 'package:mobile/models/user.dart';
import 'package:mobile/pages/home.dart';
import './register.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isHidden1 = true;
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(227, 255, 253, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(227, 255, 253, 1),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: SizedBox(
          height: 500,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            scrollDirection: Axis.vertical,
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
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        User user = User();
                        user.pass = passC.text.hashCode.toString();
                        user.email = emailC.text;
                        var response = await http.post(
                            Uri.parse("${ApiService().baseUrl}api/user/login/"),
                            headers: {'Content-Type': 'application/json'},
                            body: jsonEncode(
                                {"email": user.email, "password": user.pass}));

                        Map<String, dynamic> data =
                            jsonDecode(response.body) as Map<String, dynamic>;

                        if (response.statusCode == 200) {
                          // Success: update the global status
                          Status().isLogin = true;

                          // Navigate to the home page
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Home()),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.black,
                              content: Text(
                                'Berhasil Login',
                                style: TextStyle(color: Colors.white),
                              ),
                              action: SnackBarAction(
                                label: "Close",
                                onPressed: () {},
                                textColor: Colors.white,
                              ),
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        } else {
                          print(data);
                          // Failure: show the error message
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
                        "Masuk",
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
                          "Belum punya akun?",
                          style: TextStyle(),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RegisterPage()),
                            );
                          },
                          child: Text(
                            "Buat akun",
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
