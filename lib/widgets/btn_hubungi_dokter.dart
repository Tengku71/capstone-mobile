import 'package:flutter/material.dart';

class BtnHubungiDokter extends StatelessWidget {
  const BtnHubungiDokter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        height: 40, // Set height for the button
        decoration: BoxDecoration(
          color: const Color.fromRGBO(33, 150, 243, 1), // Blue button color
          borderRadius: BorderRadius.circular(30),
        ),
        child: TextButton(
          onPressed: () {},
          child: const Text(
            "Hubungi Dokter",
            style: TextStyle(
              color: Colors.white, // Text color
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
