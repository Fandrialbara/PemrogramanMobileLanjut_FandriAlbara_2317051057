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
    // Timer selama 7 detik sebelum berpindah otomatis ke halaman login
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
      // Warna latar belakang lembut agar selaras dengan tema hijau
      backgroundColor: Colors.green.shade50,

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo aplikasi diperbesar agar terlihat jelas dan menarik
            Image.asset(
              'assets/images/logo.png',
              height: 180, // sebelumnya 120 → diperbesar agar lebih menonjol
            ),

            const SizedBox(height: 30), // beri jarak lebih lega di bawah logo

            // Nama aplikasi (judul utama)
            const Text(
              'Toko Buah Albara',
              style: TextStyle(
                fontSize: 28, // sedikit diperbesar agar seimbang dengan logo
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),

            const SizedBox(height: 12),

            // Tagline toko (subjudul)
            const Text(
              'Segar setiap hari, penuh vitamin alami',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black54,
                fontStyle: FontStyle.italic,
              ),
            ),

            const SizedBox(height: 35),

            // Indikator loading animasi
            const CircularProgressIndicator(color: Colors.green),
          ],
        ),
      ),
    );
  }
}
