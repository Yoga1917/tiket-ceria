import 'dart:io';
import 'package:path/path.dart' as path;

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiket_ceria/pages/home/transaksi.dart';

class Transfer extends StatefulWidget {
  final String asset;
  final String pembayaran;
  final String nomor;
  final String nama;
  final int totalPembayaran;

  Transfer({
    required this.asset,
    required this.pembayaran,
    required this.nomor,
    required this.nama,
    required this.totalPembayaran,
  });

  @override
  _MyTransferState createState() => _MyTransferState();
}

class _MyTransferState extends State<Transfer> {
  String? imagePath;
  String email = '';
  late File buktiImage;

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        print("Image from gallery: ${pickedFile.path}");
        imagePath = pickedFile.path;
        buktiImage = File(pickedFile.path);
      });
      print(imagePath);
    }
  }

  void _saveBukti() {
    print("Saving profile...");
    print("Picked Image Path: $imagePath");
    upload();
  }

  upload() async {
    if (buktiImage != null) {
    final storage = FirebaseStorage.instance;
    final reference = storage.ref().child(
        'bukti/${email.replaceAll('@gmail.com', '')}${path.extension(buktiImage.path)}');
    await reference.putFile(buktiImage);
    final url= await reference.getDownloadURL();
    print("Image uploaded to Firebase Storage. URL: $url");
    Navigator.push(
context, MaterialPageRoute(
  builder: (context) => TransaksiPage(),
)
    );
  } else {
    print("No image selected");
  }
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
          'Transfer Pembayaran',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 30),
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
                      Text(
                        "Transfer Ke",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        height: 1,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Row(
                          children: [
                            Image.asset(
                              widget.asset,
                              width: 50,
                              height: 50,
                            ),
                            SizedBox(width: 10),
                            Text(
                              widget.pembayaran,
                              style: TextStyle(
                                color: Color.fromARGB(255, 0x5F, 0x5C, 0xDE),
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Spacer(),
                            Text(
                              widget.nomor,
                              style: TextStyle(
                                color: Color.fromARGB(255, 0x5F, 0x5C, 0xDE),
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
                SizedBox(height: 30),
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
                      Text(
                        "Atas Nama",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        height: 1,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Center(
                          child: Text(
                            widget.nama,
                            style: TextStyle(
                              color: Color.fromARGB(255, 0x5F, 0x5C, 0xDE),
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
                SizedBox(height: 30),
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
                      Text(
                        "Total Pembayaran",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        height: 1,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Center(
                          child: Text(
                            'Rp${widget.totalPembayaran}',
                            style: TextStyle(
                              color: const Color(0xFFD8AC5A),
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
                SizedBox(height: 30),
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
                      Text(
                        "Kirim Bukti Pembaran",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        height: 1,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 10),
                      if (imagePath != null) ...[
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Container(
                            width: double.infinity,
                            height: 400,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: FileImage(
                                  File(imagePath!),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                      GestureDetector(
                        onTap: () {
                          pickImage();
                        },
                        child: Container(
                          width: 100,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 0x5F, 0x5C, 0xDE),
                          ),
                          child: Center(
                            child: Text(
                              "Pilih",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                GestureDetector(
                  onTap: _saveBukti,
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 0x5F, 0x5C, 0xDE),
                    ),
                    child: Center(
                      child: Text(
                        "Kirim",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}