import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'profile_screen.dart'; // Import halaman profil

class DashboardScreen extends StatelessWidget {
  // Daftar buah: berisi nama, harga, gambar, dan deskripsi singkat
  final List<Map<String, dynamic>> fruits = [
    {
      'nama': 'Apel Merah',
      'harga': 15000,
      'gambar': 'assets/images/apel.png',
      'deskripsi': 'Apel segar dengan rasa manis alami, kaya vitamin C.'
    },
    {
      'nama': 'Pisang Raja',
      'harga': 12000,
      'gambar': 'assets/images/pisang.png',
      'deskripsi': 'Pisang berkualitas tinggi, lembut dan manis di lidah.'
    },
    {
      'nama': 'Jeruk Manis',
      'harga': 10000,
      'gambar': 'assets/images/jeruk.png',
      'deskripsi': 'Jeruk segar dengan rasa manis asam yang menyegarkan.'
    },
    {
      'nama': 'Semangka',
      'harga': 20000,
      'gambar': 'assets/images/semangka.png',
      'deskripsi': 'Buah besar berair, cocok dinikmati saat cuaca panas.'
    },
    {
      'nama': 'Melon Hijau',
      'harga': 18000,
      'gambar': 'assets/images/melon.png',
      'deskripsi': 'Melon segar dengan aroma manis dan tekstur lembut.'
    },
    {
      'nama': 'Mangga Harum Manis',
      'harga': 22000,
      'gambar': 'assets/images/mangga.png',
      'deskripsi': 'Mangga unggulan dengan rasa legit dan aroma khas.'
    },
    {
      'nama': 'Anggur Ungu',
      'harga': 25000,
      'gambar': 'assets/images/anggur.png',
      'deskripsi': 'Anggur manis kaya antioksidan untuk kesehatan tubuh.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Warna latar belakang dashboard
      backgroundColor: Colors.green.shade50,

      // AppBar (judul dan tombol di atas)
      appBar: AppBar(
        title: const Text(
          'Toko Buah Albara',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: [
          // Tombol menuju halaman profil
          IconButton(
            icon: const Icon(Icons.person),
            tooltip: 'Profil',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
          ),
          // Tombol logout
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Keluar',
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
        ],
      ),

      // Isi halaman utama
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header toko
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.green.shade700, Colors.green.shade400],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 3),
                    blurRadius: 6,
                  ),
                ],
              ),
              child: const Column(
                children: [
                  Text(
                    'Selamat Datang di Toko Buah Albara!',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Segar, sehat, dan penuh vitamin setiap hari',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            // Grid daftar buah
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(), // satu scroll dengan halaman
                shrinkWrap: true,
                itemCount: fruits.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // dua kolom
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.78, // rasio dikit di-tweak untuk proporsi baru
                ),
                itemBuilder: (context, index) {
                  final buah = fruits[index];

                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0, 3),
                          blurRadius: 6,
                        ),
                      ],
                    ),

                    // Padding dalam kartu agar tampilan lega
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // Gambar: pakai ClipRRect dengan rounding hanya di bagian atas
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                            ),
                            // Container agar bisa mengatur ukuran dan alignment gambar
                            child: Container(
                              height: 110, // tinggi gambar proporsional
                              width: double.infinity,
                              color: Colors.grey.shade100, // latar sementara bila gambar transparan
                              child: Image.asset(
                                buah['gambar'],
                                fit:
                                    BoxFit.contain, // tampilkan seluruh gambar, jangan crop
                                alignment: Alignment.center,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),

                          // Nama buah
                          Text(
                            buah['nama'],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.center,
                          ),

                          // Harga buah
                          Text(
                            'Rp ${buah['harga']} /kg',
                            style: TextStyle(
                              color: Colors.green.shade700,
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                          ),

                          // Deskripsi singkat, dibatasi 2 baris agar rapi
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 6),
                            child: Text(
                              buah['deskripsi'],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.black54,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),

                          const Spacer(), // dorong tombol ke bawah agar konsisten

                          // Tombol Beli
                          ElevatedButton.icon(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Kamu membeli ${buah['nama']} seharga Rp${buah['harga']}',
                                  ),
                                ),
                              );
                            },
                            icon: const Icon(Icons.shopping_cart,
                                size: 18, color: Colors.white),
                            label: const Text(
                              'Beli',
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green.shade600,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 6),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
