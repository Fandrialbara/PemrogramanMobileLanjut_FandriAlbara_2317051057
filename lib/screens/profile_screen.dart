import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Warna latar belakang 
      backgroundColor: Colors.green.shade50,

      appBar: AppBar(
        title: const Text('Profil Saya'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Foto profil (diambil dari folder assets)
            CircleAvatar(
              radius: 60,
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

            // Informasi detail pengguna
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  // Judul informasi
                  Text(
                    'Informasi Pribadi',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  Divider(color: Colors.green),
                  SizedBox(height: 10),

                  // Email pengguna
                  ListTile(
                    leading: Icon(Icons.email, color: Colors.green),
                    title: Text('Email'),
                    subtitle: Text('jarjit@gmail.com'),
                  ),

                  // Nomor telepon pengguna
                  ListTile(
                    leading: Icon(Icons.phone, color: Colors.green),
                    title: Text('Nomor Telepon'),
                    subtitle: Text('+62 812-1233-2345'),
                  ),

                  // Alamat pengguna
                  ListTile(
                    leading: Icon(Icons.location_on, color: Colors.green),
                    title: Text('Alamat'),
                    subtitle: Text('Jl. Borax No. 123, Rajabasa'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Tombol Edit Profil
            ElevatedButton.icon(
              onPressed: () {
                // Untuk tampilan saja, belum berfungsi
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
                backgroundColor: Colors.green.shade600,
                minimumSize: const Size(double.infinity, 45),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
