import 'package:flutter/material.dart';
import 'dashboard_screen.dart'; 
import 'signup_screen.dart';   

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Controller untuk input username & password
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Fungsi login
  void _login() {
    String user = _usernameController.text.trim();
    String pass = _passwordController.text.trim();

    // Cek apakah akun terdaftar
    final akun = akunTerdaftar.firstWhere(
      (a) => a['username'] == user && a['password'] == pass,
      orElse: () => {},
    );

    if (akun.isNotEmpty) {
      // Jika benar, pindah ke dashboard
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashboardScreen()),
      );
    } else {
      // Jika salah, tampilkan pesan
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Username atau password salah!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // 🖼️ Ganti ikon toko dengan gambar logo
                Image.asset(
                  'assets/images/logo.png', // lokasi logo kamu
                  height: 120, // tinggi gambar
                ),
                const SizedBox(height: 20),

                // Judul halaman login
                const Text(
                  'Login Toko Buah',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),

                // Input Username
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                // Input Password
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 25),

                // Tombol Masuk
                ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    minimumSize: const Size(double.infinity, 45),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('Masuk'),
                ),
                const SizedBox(height: 15),

                // Tombol untuk pindah ke halaman daftar
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()),
                    );
                  },
                  child: const Text('Belum punya akun? Daftar di sini'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
