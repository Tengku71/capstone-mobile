import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile/models/hasil.dart';

class BtnUnggah extends StatefulWidget {
  const BtnUnggah({super.key});

  @override
  _BtnUnggahState createState() => _BtnUnggahState();
}

class _BtnUnggahState extends State<BtnUnggah> {
  Hasil hasil = Hasil();

  // Function to pick an image from the gallery or camera
  Future<void> _pickImage(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: source);

    if (image != null) {
      setState(() {
        hasil.gambar_mata = image.name; // Set the file name
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(54, 91, 109, 1),
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextButton(
            onPressed: () {
              // Reset the file name prompt when the user opens the modal
              setState(() {
                hasil.gambar_mata =
                    "Choose File"; // Reset to allow the prompt text
              });

              showModalBottomSheet(
                context: context,
                builder: (context) => Container(
                  height: 200,
                  color: Colors.white,
                  child: ListView(
                    children: [
                      ListTile(
                        onTap: () {
                          _pickImage(ImageSource.gallery); // Pick from gallery
                          Navigator.pop(context); // Close the modal
                        },
                        leading: const Icon(Icons.photo),
                        title: const Text("Photo"),
                      ),
                      ListTile(
                        onTap: () {
                          _pickImage(ImageSource.camera); // Pick from camera
                          Navigator.pop(context); // Close the modal
                        },
                        leading: const Icon(Icons.camera),
                        title: const Text("Camera"),
                      ),
                    ],
                  ),
                ),
              );
            },
            child: Text(
              hasil.gambar_mata ??
                  "Choose File", // Display file name or prompt text
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
