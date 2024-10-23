import 'package:flutter/material.dart';
import '../pages/cek_kesehatan_mata.dart';

class btn_cek_kesehatan_mata extends StatelessWidget {
  const btn_cek_kesehatan_mata({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CekKesehatanMata()),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
      ),
      label: const Text(
        "Cek Kesehatan Mata",
        style: TextStyle(
          color: Colors.white,
          fontSize: 15,
        ),
      ),
      icon: const Icon(
        Icons.add,
        color: Colors.white,
        size: 25,
        weight: 800,
      ),
    );
  }
}
