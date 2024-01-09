import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path/path.dart' as path;

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiket_ceria/pages/home/navigasi.dart';
import 'package:tiket_ceria/pages/home/profil.dart';

class EditProfil extends StatefulWidget {
  @override
  _EditProfilState createState() => _EditProfilState();
}

class _EditProfilState extends State<EditProfil> {
  String email = '';
  String name = '';
  String? pickedImagePath;
  late File cacheImage;

  void initState() {
    super.initState();
    _loadUser();
  }

  _loadUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      email = prefs.getString('email') ?? '';
      name = prefs.getString('name') ?? '';
    });
  }

  Future<void> _getImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      print("Image from gallery: ${pickedFile.path}");
      setState(() {
        pickedImagePath = pickedFile.path;
        cacheImage = File(pickedFile.path);
      });
    }
  }

  Future<void> _getImageFromCamera() async {
    final status = await Permission.camera.request();
    if (status.isGranted) {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.camera);

      if (pickedFile != null) {
        print("Image from camera: ${pickedFile.path}");
        setState(() {
          pickedImagePath = pickedFile.path;
          cacheImage = File(pickedFile.path);
        });
      }
    } else {
      print("Permission Denied");
    }
  }

  void _saveProfile() {
    print("Saving profile...");
    print("Picked Image Path: $pickedImagePath");
    upload();
  }

  upload() async {
    if (cacheImage != null) {
    final storage = FirebaseStorage.instance;
    final reference = storage.ref().child(
        'profil/${email.replaceAll('@gmail.com', '')}${path.extension(cacheImage.path)}');

    // Upload the image to Firebase Storage
    await reference.putFile(cacheImage);

    // Get the download URL of the uploaded image
    final url = await reference.getDownloadURL();

    print("Image uploaded to Firebase Storage. URL: $url");

    // Save the URL to Firestore
    saveImageUrlToFirestore(url);

    // Navigate to the ProfilePage and pass the URL
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => ProfilePage(imageUrl: url),
      ),
      (route) => false,
    );
  } else {
    print("No image selected");
  }
  }

  void saveImageUrlToFirestore(String imageUrl) async {
  try {
    final firestore = FirebaseFirestore.instance;
    final userDocRef = firestore.collection('users').doc(email); // Assuming each user has a unique document with their email as the ID
    await userDocRef.update({'profileImageUrl': imageUrl});
    print("Image URL saved to Firestore");
  } catch (error) {
    print("Error saving image URL to Firestore: $error");
  }
}

  Future<void> _showImagePickerDialog() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Pilih Sumber Gambar"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text("Galeri"),
                onTap: () {
                  Navigator.pop(context);
                  _getImageFromGallery();
                },
              ),
              ListTile(
                title: Text("Kamera"),
                onTap: () {
                  Navigator.pop(context);
                  _getImageFromCamera();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Edit Profil',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 15),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Foto Profil",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      height: 1,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 20),
                    if (pickedImagePath != null) ...[
                      Container(
                        width: double.infinity,
                        height: 250,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: FileImage(
                              File(pickedImagePath!),
                            ),
                          ),
                        ),
                      ),
                    ],
                    if (pickedImagePath == null) ...[
                      Icon(
                        Icons.account_circle,
                        size: 300,
                        color: Colors.grey,
                      )
                    ],
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        _showImagePickerDialog();
                      },
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: 200,
                        ),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 0x5F, 0x5C, 0xDE),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              "Ganti Foto",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 15),
                    Text(
                      "Data Profil",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      height: 1,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 10),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Nama",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                width: 350,
                                height: 60,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(13),
                                  child: Text(
                                    name,
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 30),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Email",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                width: 350,
                                height: 60,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(13),
                                  child: Text(
                                    email,
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 30),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: _saveProfile,
                child: Container(
                  width: double.infinity,
                  height: 55,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 0x5F, 0x5C, 0xDE),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "Simpan",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
