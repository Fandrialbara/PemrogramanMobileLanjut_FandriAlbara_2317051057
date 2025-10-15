import 'package:flutter/material.dart';
import 'dashboard_screen.dart';
import 'signup_screen.dart'; // Import halaman daftar akun

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Controller untuk menampung input dari TextField
  // Digunakan untuk mengambil teks yang diketik pengguna
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Fungsi untuk melakukan proses login
  void _login() {
    // Mengambil teks yang diketik pengguna dan menghapus spasi di awal/akhir
    String user = _usernameController.text.trim();
    String pass = _passwordController.text.trim();

    // Mencari apakah username dan password cocok dengan akun yang sudah didaftarkan
    final akun = akunTerdaftar.firstWhere(
      (a) => a['username'] == user && a['password'] == pass,
      orElse: () => {}, // Jika tidak ditemukan, kembalikan map kosong
    );

    // Jika akun ditemukan (berarti username dan password benar)
    if (akun.isNotEmpty) {
      // Arahkan pengguna ke halaman Dashboard dan ganti halaman login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashboardScreen()),
      );
    } else {
      // Jika tidak cocok, tampilkan notifikasi kesalahan di bagian bawah layar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Username atau password salah!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Warna latar belakang dibuat senada dengan tema aplikasi
      backgroundColor: Colors.green.shade50,

      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          // SingleChildScrollView agar tampilan tetap bisa di-scroll saat keyboard muncul
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

                // TextField untuk username
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    labelStyle: TextStyle(color: Colors.green.shade700),
                    prefixIcon: Icon(Icons.person, color: Colors.green.shade600),
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

                // TextField untuk password (obscureText agar karakter disembunyikan)
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.green.shade700),
                    prefixIcon: Icon(Icons.lock, color: Colors.green.shade600),
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

                // Tombol untuk melakukan login
                ElevatedButton(
                  onPressed: _login, // Memanggil fungsi _login saat ditekan
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

                // Tombol untuk berpindah ke halaman daftar akun (Sign Up)
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
