import 'package:flutter/material.dart';
import 'login_screen.dart';

List<Map<String, String>> akunTerdaftar = [];

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();

  void _daftar() {
    String user = _usernameController.text.trim();
    String pass = _passwordController.text.trim();
    String confirm = _confirmController.text.trim();

    if (user.isEmpty || pass.isEmpty || confirm.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Semua field harus diisi!')),
      );
    } else if (pass != confirm) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password tidak sama!')),
      );
    } else {
      akunTerdaftar.add({'username': user, 'password': pass});
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Akun $user berhasil dibuat!')),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        title: const Text('Daftar Akun Baru'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/images/logo.png', height: 100),
              const SizedBox(height: 20),
              const Text(
                'Buat Akun Anda',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 30),
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
              const SizedBox(height: 15),
              TextField(
                controller: _confirmController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Konfirmasi Password',
                  labelStyle: TextStyle(color: Colors.green.shade700),
                  prefixIcon: Icon(Icons.check_circle, color: Colors.green.shade600),
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
              ElevatedButton(
                onPressed: _daftar,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade600,
                  minimumSize: const Size(double.infinity, 45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 3,
                ),
                child: const Text(
                  'Daftar Sekarang',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // font jadi putih agar jelas
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextButton(
                onPressed: () {
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
