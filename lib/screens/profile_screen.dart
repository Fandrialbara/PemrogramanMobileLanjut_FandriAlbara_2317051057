import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Warna latar belakang halaman profil
      backgroundColor: Colors.green.shade50,

      // AppBar di bagian atas halaman
      appBar: AppBar(
        title: const Text('Profil Saya'), // Judul AppBar
        centerTitle: true, // Menempatkan judul di tengah
        backgroundColor: Colors.green, // Warna AppBar disesuaikan tema
      ),

      // Body utama yang bisa di-scroll agar responsif di berbagai layar
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Foto profil pengguna dari folder assets
            CircleAvatar(
              radius: 60, // Ukuran lingkaran foto
              backgroundImage: const AssetImage('assets/images/profile.jpg'),
              backgroundColor: Colors.green.shade100,
            ),
            const SizedBox(height: 20),

            // Nama pengguna
            const Text(
              'Fandri Albara',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 6),

            // Username atau ID akun
            const Text(
              'RRQkingdirotzilongglobal1',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 25),

            // Kotak berisi detail informasi pribadi pengguna
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white, // Latar putih agar teks jelas terbaca
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  // Efek bayangan agar tampilan lebih elegan
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),

              // Informasi pribadi dalam bentuk ListTile agar rapi
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  // Judul untuk bagian informasi pribadi
                  Text(
                    'Informasi Pribadi',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  Divider(color: Colors.green), // Garis pemisah
                  SizedBox(height: 10),

                  // Baris informasi email
                  ListTile(
                    leading: Icon(Icons.email, color: Colors.green),
                    title: Text('Email'),
                    subtitle: Text('jarjit@gmail.com'),
                  ),

                  // Baris informasi nomor telepon
                  ListTile(
                    leading: Icon(Icons.phone, color: Colors.green),
                    title: Text('Nomor Telepon'),
                    subtitle: Text('+62 812-1233-2345'),
                  ),

                  // Baris informasi alamat
                  ListTile(
                    leading: Icon(Icons.location_on, color: Colors.green),
                    title: Text('Alamat'),
                    subtitle: Text('Jl. Borax No. 123, Rajabasa'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Tombol untuk mengedit profil (belum aktif)
            ElevatedButton.icon(
              onPressed: () {
                // Menampilkan pesan sementara menggunakan SnackBar
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Fitur edit profil belum tersedia'),
                  ),
                );
              },
              icon: const Icon(Icons.edit, color: Colors.white),
              label: const Text(
                'Edit Profil',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade600, // Warna tombol
                minimumSize: const Size(double.infinity, 45), // Lebar penuh
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Sudut membulat
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
