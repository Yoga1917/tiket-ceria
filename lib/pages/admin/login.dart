import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tiket_ceria/auth/firebase_auth_services.dart';
import 'package:tiket_ceria/common/toast.dart';
import 'package:tiket_ceria/pages/admin/daftar.dart';
import 'package:tiket_ceria/pages/admin/lupa_sandi.dart';
import 'package:tiket_ceria/widget/form_container_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isSigning = false;
  final FirebaseAuthService _auth = FirebaseAuthService();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Image.asset(
          'assets/logo2.png',
          width: 120,
          height: 30,
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Masuk",
                            style: TextStyle(
                                fontSize: 27, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Belum Punya Akun?"),
                              SizedBox(
                                width: 5,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUpPage()),
                                    (route) => false,
                                  );
                                },
                                child: Text(
                                  "Daftar",
                                  style: TextStyle(
                                    color:
                                        Color.fromARGB(255, 0x5F, 0x5C, 0xDE),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            height: 1,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          FormContainerWidget(
                            controller: _emailController,
                            hintText: "Alamat Email",
                            isPasswordField: false,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          FormContainerWidget(
                            controller: _passwordController,
                            hintText: "Kata Sandi",
                            isPasswordField: true,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LupaSandi()),
                                (route) => false,
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "Lupa Kata Sandi?",
                                  style: TextStyle(
                                    color:
                                        Color.fromARGB(255, 0x5F, 0x5C, 0xDE),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          GestureDetector(
                            onTap: () {
                              _signIn();
                            },
                            child: Container(
                              width: double.infinity,
                              height: 45,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 0x5F, 0x5C, 0xDE),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: _isSigning
                                    ? CircularProgressIndicator(
                                        color: Colors.white,
                                      )
                                    : Text(
                                        "Masuk",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  height: 1,
                                  color: Colors.grey,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text('Atau Masuk Dengan'),
                              ),
                              Expanded(
                                child: Container(
                                  height: 1,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _signIn() async {
    setState(() {
      _isSigning = true;
    });

    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    setState(() {
      _isSigning = false;
    });

    if (user != null) {
      showToast(message: "Selamat Datang di Tiket Ceria :)");
      Navigator.pushNamed(context, "/beranda");
    } else {
      showToast(message: "Email atau Sandi Anda Salah!!!");
    }
  }
}
