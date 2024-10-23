import 'package:flutter/material.dart';

class Developer extends StatelessWidget {
  List developer = [
    "Rizki Eka Mulyani",
    "Fathur Rizqi Putra Pratama",
    "Muhammad Rafli Eriyanto",
    "Tengku Dimas Aditya"
  ];

  Developer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: developer.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) => Column(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(75)),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              developer[index],
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
