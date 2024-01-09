import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiket_ceria/pages/profil/edit_profil.dart';
import 'package:tiket_ceria/pages/profil/ganti_sandi.dart';
import 'package:tiket_ceria/pages/profil/kebijakan.dart';
import 'package:tiket_ceria/pages/profil/syarat.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatefulWidget {
  String imageUrl = '';
  final bool isProfilePage;

  
  ProfilePage({required this.imageUrl, this.isProfilePage = false});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String email = '';
  String name = '';
  

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

   

  void _launchWhatsApp() async {
    final String phoneNumber = '6281390628224';
    final String message = 'Halo, Saya Butuh Bantuan!!!';

    final String url = 'https://wa.me/$phoneNumber?text=${Uri.parse(message)}';

    if (!await launchUrl(Uri.parse(url))) {
      print('Could not launch $url');
    }
  }

  void _launchYouTube() async {
    const String youtubeVideoId = 'TAEihBAB968';
    final String url = 'https://www.youtube.com/watch?v=$youtubeVideoId';

    if (!await launchUrl(Uri.parse(url))) {
      print('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        title: Text(
          'Profil',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfil()),
                );
              },
              child: Text(
                'Edit Profil',
                style: TextStyle(
                  color: Color.fromARGB(255, 0x5F, 0x5C, 0xDE),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey, width: 1),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 10),
                      child: widget.imageUrl == ''
                      ? Icon(
                        Icons.account_circle,
                        color: Colors.grey,
                        size: 50,
                      )
                      : Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(widget.imageUrl),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 3),
                          child: Text(
                            name,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          email,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 35,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Keamanan",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => GantiSandi()),
                        );
                      },
                      child: Container(
                        width: 360,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.grey, width: 1)),
                        ),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 0),
                              child: Icon(Icons.lock_outlined,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 0),
                                child: Text(
                                  'Ganti Password',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios_rounded,
                                color: Colors.grey),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Pusat Bantuan",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: GestureDetector(
                      onTap: _launchWhatsApp,
                      child: Container(
                        width: 360,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.grey, width: 1)),
                        ),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 0),
                              child: Icon(Icons.wifi_calling_3_outlined,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 0),
                                child: Text(
                                  'Hubungi Kami',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios_rounded,
                                color: Colors.grey),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Tentang",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: GestureDetector(
                      onTap: _launchYouTube,
                      child: Container(
                        width: 360,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.grey, width: 1)),
                        ),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 0),
                              child:
                                  Icon(Icons.help_outline, color: Colors.black),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 0),
                                child: Text(
                                  'Apa itu Tiket Ceria?',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios_rounded,
                                color: Colors.grey),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Syarat()),
                        );
                      },
                      child: Container(
                        width: 360,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.grey, width: 1)),
                        ),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 0),
                              child: Icon(Icons.description_outlined,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 0),
                                child: Text(
                                  'Syarat & Ketentuan',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios_rounded,
                                color: Colors.grey),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Kebijakan()),
                        );
                      },
                      child: Container(
                        width: 360,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.grey, width: 1)),
                        ),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 0),
                              child: Icon(Icons.shield_outlined,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 0),
                                child: Text(
                                  'Kebijakan Privasi',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios_rounded,
                                color: Colors.grey),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: GestureDetector(
                      onTap: () {
                        _showLogoutConfirmationDialog(context);
                      },
                      child: Container(
                        width: double.infinity,
                        height: 45,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 211, 209, 209),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Center(
                          child: Text(
                            "Keluar",
                            style: TextStyle(
                              color: Color.fromARGB(255, 195, 58, 48),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _showLogoutConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Konfirmasi Keluar"),
        content: Text("Apakah Anda yakin ingin keluar?"),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              "Tidak",
              style: TextStyle(
                color: Color.fromARGB(255, 0x5F, 0x5C, 0xDE),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              _signOut();
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed('/login');
            },
            child: Text(
              "Ya",
              style: TextStyle(
                color: Color.fromARGB(255, 0x5F, 0x5C, 0xDE),
              ),
            ),
          ),
        ],
      );
    },
  );
}

void _signOut() async {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear();

  await _auth.signOut();
  await _googleSignIn.signOut();
}
