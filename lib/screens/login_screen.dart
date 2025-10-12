import 'package:flutter/material.dart';
import 'dashboard_screen.dart';
import 'signup_screen.dart'; // Import halaman daftar akun

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Controller untuk menampung inputan username dan password
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Fungsi untuk proses login
  void _login() {
    String user = _usernameController.text.trim();
    String pass = _passwordController.text.trim();

    // Mencocokkan data username & password dengan akun yang terdaftar
    final akun = akunTerdaftar.firstWhere(
      (a) => a['username'] == user && a['password'] == pass,
      orElse: () => {}, // Jika tidak ditemukan
    );

    if (akun.isNotEmpty) {
      // Jika username & password cocok → masuk ke Dashboard
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashboardScreen()),
      );
    } else {
      // Jika salah → tampilkan notifikasi (SnackBar)
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Username atau password salah!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Warna latar belakang agar senada dengan tema utama
      backgroundColor: Colors.green.shade50,

      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Logo aplikasi dari folder assets
                Image.asset('assets/images/logo.png', height: 120),
                const SizedBox(height: 20),

                // Judul halaman login
                const Text(
                  'Silahkan Login atau Daftar',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 30),

                // Input username
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    labelStyle: TextStyle(color: Colors.green.shade700),
                    prefixIcon:
                        Icon(Icons.person, color: Colors.green.shade600),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green.shade300),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green.shade600),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                // Input password
                TextField(
                  controller: _passwordController,
                  obscureText: true, // Agar input disembunyikan
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.green.shade700),
                    prefixIcon:
                        Icon(Icons.lock, color: Colors.green.shade600),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green.shade300),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green.shade600),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 25),

                // Tombol "Masuk"
                ElevatedButton(
                  onPressed: _login, // Jalankan fungsi login
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade600,
                    minimumSize: const Size(double.infinity, 45),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 3,
                  ),
                  child: const Text(
                    'Masuk',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Warna teks putih agar kontras
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                // Tombol menuju halaman daftar akun
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()),
                    );
                  },
                  child: Text(
                    'Belum punya akun? Daftar di sini',
                    style: TextStyle(
                      color: Colors.green.shade700,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
