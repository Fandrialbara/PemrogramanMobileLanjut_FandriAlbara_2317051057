import 'package:flutter/material.dart';
import 'login_screen.dart'; // Import agar bisa kembali ke halaman login

class DashboardScreen extends StatelessWidget {
  // Data buah: nama, harga, dan gambar
  final List<Map<String, dynamic>> fruits = [
    {'nama': 'Apel Merah', 'harga': 15000, 'gambar': 'assets/images/apel.png'},
    {'nama': 'Pisang Raja', 'harga': 12000, 'gambar': 'assets/images/pisang.png'},
    {'nama': 'Jeruk Manis', 'harga': 10000, 'gambar': 'assets/images/jeruk.png'},
    {'nama': 'Semangka', 'harga': 20000, 'gambar': 'assets/images/semangka.png'},
    {'nama': 'Melon Hijau', 'harga': 18000, 'gambar': 'assets/images/melon.png'},
    {'nama': 'Mangga Harum Manis', 'harga': 22000, 'gambar': 'assets/images/mangga.png'},
    {'nama': 'Anggur Ungu', 'harga': 25000, 'gambar': 'assets/images/anggur.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Warna latar belakang halaman
      backgroundColor: Colors.green.shade50,

      // Bagian AppBar di atas layar
      appBar: AppBar(
        title: const Text(
          'Toko Buah Albara',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: [
          // Tombol logout di AppBar
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Keluar',
            onPressed: () {
              // Aksi keluar: kembali ke halaman login
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
        ],
      ),

      // Bagian utama halaman (body)
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header atau banner toko
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
              child: Column(
                children: const [
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

            // Bagian daftar buah, menggunakan GridView agar tampilan lebih menarik
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: fruits.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Dua kolom
                  crossAxisSpacing: 12, // Jarak antar kolom
                  mainAxisSpacing: 12, // Jarak antar baris
                  childAspectRatio: 0.8, // Perbandingan ukuran item
                ),
                itemBuilder: (context, index) {
                  final buah = fruits[index];
                  return GestureDetector(
                    onTap: () {
                      // Menampilkan notifikasi saat item ditekan
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              'Kamu memilih ${buah['nama']} seharga Rp${buah['harga']}'),
                        ),
                      );
                    },
                    child: Container(
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Gambar buah dari folder assets
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              buah['gambar'],
                              width: 90,
                              height: 90,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 10),

                          // Nama buah
                          Text(
                            buah['nama'],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),

                          const SizedBox(height: 5),

                          // Harga buah
                          Text(
                            'Rp ${buah['harga']} /kg',
                            style: TextStyle(
                              color: Colors.green.shade700,
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          const SizedBox(height: 8),

                          // Tombol beli
                          ElevatedButton.icon(
                            onPressed: () {
                              // Tampilkan notifikasi saat tombol beli ditekan
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      'Kamu membeli ${buah['nama']} seharga Rp${buah['harga']}'),
                                ),
                              );
                            },
                            icon: const Icon(Icons.shopping_cart, size: 18),
                            label: const Text('Beli'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 6,
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
