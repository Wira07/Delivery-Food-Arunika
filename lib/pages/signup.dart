import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/pages/bottomnav.dart';
import 'package:fooddelivery/pages/login.dart';
import 'package:fooddelivery/service/database.dart';
import 'package:random_string/random_string.dart';
import '../service/shared_pref.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String email = "", password = "", name = "";

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mailController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  registration() async {
    if (_formkey.currentState!.validate()) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.green,
          content: Text(
            "Pendaftaran Berhasil",
            style: TextStyle(fontSize: 20.0),
          ),
        ));
        String Id = randomAlphaNumeric(10);
        Map<String, dynamic> addUserInfo = {
          "Name": nameController.text, // Perbaikan: namecontroller -> nameController
          "Email": mailController.text, // Perbaikan: mailcontroller -> mailController
          "Wallet": "0",
          "Id": Id,
        };

        // Save user information to Firestore (in 'users' collection)
        await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set(addUserInfo);
        await SharedPreferenceHelper().saveUserName(nameController.text); // Perbaikan: namecontroller -> nameController
        await SharedPreferenceHelper().saveUserEmail(mailController.text); // Perbaikan: mailcontroller -> mailController
        await DatabaseMethods().addUserDetail(addUserInfo, Id);
        // await SharedPreferenceHelper().saveUserName(namecontroller.text);
        // await SharedPreferenceHelper().saveUserEmail(mailcontroller.text);
        await SharedPreferenceHelper().saveUserWallet('0');
        await SharedPreferenceHelper().saveUserId(Id);
        // Navigasi ke halaman utama
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const BottomNav()),
        );
      } on FirebaseException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "Kata Sandi Lemah",
              style: TextStyle(fontSize: 18.0),
            ),
          ));
        } else if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "Akun Sudah Ada",
              style: TextStyle(fontSize: 20.0),
            ),
          ));
        }
      }
    }
  }

  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20.0),
              Center(
                child: Image.asset(
                  "images/logo_arunika_white.png",
                  height: 200,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 20.0),
              const Text(
                "Buat Akun Anda",
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10.0),
              Text(
                "Mulai perjalanan Anda bersama kami. Ayo wujudkan bersama!",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey.shade400,
                ),
              ),
              const SizedBox(height: 30.0),
              Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1A1A2E),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: nameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Harap Masukkan Nama Pengguna';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            name = value;
                          },
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: "Nama Pengguna",
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16.0,
                            ),
                            prefixIcon:
                            const Icon(Icons.person, color: Colors.grey),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 20),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        TextFormField(
                          controller: mailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Harap Masukkan Email';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            email = value;
                          },
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16.0,
                            ),
                            prefixIcon:
                            const Icon(Icons.email, color: Colors.grey),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 20),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        TextFormField(
                          controller: passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Harap Masukkan Kata Sandi';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            password = value;
                          },
                          obscureText: _obscurePassword,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: "Kata Sandi",
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16.0,
                            ),
                            prefixIcon: const Icon(Icons.lock_outline,
                                color: Colors.grey),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                              child: Icon(
                                _obscurePassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 20),
                          ),
                        ),
                        const SizedBox(height: 30.0),
                        GestureDetector(
                          onTap: () {
                            if (_formkey.currentState!.validate()) {
                              registration();
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Center(
                              child: Text(
                                "Daftar",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Login()),
                    );
                  },
                  child: const Text(
                    "Sudah Punya Akun? Masuk",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: const Color(0xFF0F3460),
    );
  }
}
