import 'package:flutter/material.dart';
import '../pages/login.dart';

class LoginBtn extends StatelessWidget {
  const LoginBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // return Drawer(
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       Container(
    //         alignment: Alignment.bottomLeft,
    //         padding: EdgeInsets.all(20),
    //         width: double.infinity,
    //         height: 150,
    //         color: Colors.blue,
    //         child: Text("Menu"),
    //       )
    //     ],
    //   ),
    // );
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromRGBO(227, 255, 253, 1),
      ),
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        },
        child: const Text(
          "Login",
          style: TextStyle(
            color: Color.fromRGBO(65, 193, 186, 1),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
