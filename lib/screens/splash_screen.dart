import 'package:flutter/material.dart';
import 'dart:async';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Timer selama 7 detik sebelum otomatis pindah ke halaman login
    Timer(const Duration(seconds: 7), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Warna latar belakang 
      backgroundColor: Colors.green.shade50,

      // SingleChildScrollView untuk mencegah overflow di layar kecil
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo aplikasi 
              Image.asset(
                'assets/images/logo.png',
                height: 200, // 
              ),

              const SizedBox(height: 30), // jarak di bawah logo

              // Nama aplikasi
              const Text(
                'Toko Buah Albara',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),

              const SizedBox(height: 12),

              // Tagline toko 
              const Text(
                'Segar setiap hari, penuh vitamin alami',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 40),

              // Indikator loading animasi agar pengguna tahu sedang loading
              const CircularProgressIndicator(color: Colors.green),
            ],
          ),
        ),
      ),
    );
  }
}
