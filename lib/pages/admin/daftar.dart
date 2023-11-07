import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:tiket_ceria/auth/firebase_auth_services.dart';
import 'package:tiket_ceria/common/toast.dart';
import 'package:tiket_ceria/pages/admin/login.dart';
import 'package:tiket_ceria/widget/form_container_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final FirebaseAuthService _auth = FirebaseAuthService();

  TextEditingController _nikController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool isSigningUp = false;

  @override
  void dispose() {
    _nikController.dispose();
    _usernameController.dispose();
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
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              "Daftar",
                              style: TextStyle(
                                  fontSize: 27, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Sudah Punya Akun?"),
                                SizedBox(
                                  width: 5,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginPage()),
                                      (route) => false,
                                    );
                                  },
                                  child: Text(
                                    "Masuk",
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
                              controller: _nikController,
                              hintText: "NIK",
                              isPasswordField: false,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            FormContainerWidget(
                              controller: _usernameController,
                              hintText: "Nama Lengkap",
                              isPasswordField: false,
                            ),
                            SizedBox(
                              height: 20,
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
                              height: 50,
                            ),
                            GestureDetector(
                              onTap: () {
                                _signUp();
                              },
                              child: Container(
                                width: double.infinity,
                                height: 45,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 0x5F, 0x5C, 0xDE),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                    child: isSigningUp
                                        ? CircularProgressIndicator(
                                            color: Colors.white,
                                          )
                                        : Text(
                                            "Daftar",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          )),
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Text('Atau Daftar Dengan'),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 1,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            SignInButton(
                              Buttons.google,
                              text: "Daftar Dengan Google",
                              onPressed: () {
                                _signInWithGoogle();
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  void _signUp() async {
    setState(() {
      isSigningUp = true;
    });

    String nik = _nikController.text;
    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);

    setState(() {
      isSigningUp = false;
    });
    if (user != null) {
      showToast(message: "Pendaftaran Akun Berhasil :)");
      Navigator.pushNamed(context, "/login");
    } else {
      showToast(message: "Pendaftaran Akun Gagal!!!");
    }
  }

  Future<User?> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        showToast(message: "Login Dengan Google Gagal");
        return null;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      User? user = userCredential.user;

      return user;
    } catch (e) {
      showToast(message: "Google Sign-In Error: $e");
      return null;
    }
  }
}
