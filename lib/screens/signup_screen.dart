import 'package:flutter/material.dart';
import 'login_screen.dart'; // Import halaman login agar bisa kembali ke login

// List global untuk menyimpan akun yang sudah terdaftar (sementara / lokal)
// Data ini akan diakses juga oleh halaman login
List<Map<String, String>> akunTerdaftar = [];

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // Controller digunakan untuk menangkap input teks dari pengguna
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();

  // Fungsi utama untuk proses pendaftaran akun baru
  void _daftar() {
    // Ambil teks dari masing-masing field dan hapus spasi di awal/akhir
    String user = _usernameController.text.trim();
    String pass = _passwordController.text.trim();
    String confirm = _confirmController.text.trim();

    // Validasi 1: Semua field wajib diisi
    if (user.isEmpty || pass.isEmpty || confirm.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Semua field harus diisi!')),
      );
    }
    // Validasi 2: Password dan konfirmasi password harus sama
    else if (pass != confirm) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password tidak sama!')),
      );
    } else {
      // Jika semua validasi terpenuhi, data akun disimpan ke list global
      akunTerdaftar.add({'username': user, 'password': pass});

      // Tampilkan pesan sukses
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Akun $user berhasil dibuat!')),
      );

      // Setelah akun dibuat, arahkan ke halaman login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Warna latar belakang lembut agar senada dengan tema utama (hijau segar)
      backgroundColor: Colors.green.shade50,

      // AppBar di bagian atas halaman
      appBar: AppBar(
        title: const Text('Daftar Akun Baru'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),

      // Body utama halaman
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Logo aplikasi dari folder assets
              Image.asset('assets/images/logo.png', height: 100),
              const SizedBox(height: 20),

              // Judul utama halaman
              const Text(
                'Buat Akun Anda',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 30),

              // Field input untuk Username
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

              // Field input untuk Password
              TextField(
                controller: _passwordController,
                obscureText: true, // Agar karakter password tidak terlihat
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
              const SizedBox(height: 15),

              // Field input untuk konfirmasi password
              TextField(
                controller: _confirmController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Konfirmasi Password',
                  labelStyle: TextStyle(color: Colors.green.shade700),
                  prefixIcon:
                      Icon(Icons.check_circle, color: Colors.green.shade600),
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

              // Tombol utama untuk mendaftar akun
              ElevatedButton(
                onPressed: _daftar, // Panggil fungsi daftar
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade600, // Warna tombol
                  minimumSize: const Size(double.infinity, 45), // Lebar penuh
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 3, // Sedikit bayangan agar tombol terlihat naik
                ),
                child: const Text(
                  'Daftar Sekarang',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Warna teks putih agar kontras
                  ),
                ),
              ),
              const SizedBox(height: 15),

              // Tombol kecil untuk kembali ke halaman login
              TextButton(
                onPressed: () {
                  // Navigasi balik ke LoginScreen
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                child: Text(
                  'Sudah punya akun? Login di sini',
                  style: TextStyle(
                    color: Colors.green.shade700,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
