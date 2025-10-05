import 'package:flutter/material.dart';
import 'login_screen.dart'; // import agar bisa kembali ke halaman login

class DashboardScreen extends StatelessWidget {
  //  Data dummy: daftar nama buah, harga, dan gambar
  final List<Map<String, dynamic>> fruits = [
    {
      'nama': 'Apel Merah',
      'harga': 15000,
      'gambar': 'assets/images/apel.png',
    },
    {
      'nama': 'Pisang Raja',
      'harga': 12000,
      'gambar': 'assets/images/pisang.png',
    },
    {
      'nama': 'Jeruk Manis',
      'harga': 10000,
      'gambar': 'assets/images/jeruk.png',
    },
    {
      'nama': 'Semangka',
      'harga': 20000,
      'gambar': 'assets/images/semangka.png',
    },
    {
      'nama': 'Melon Hijau',
      'harga': 18000,
      'gambar': 'assets/images/melon.png',
    },
    {
      'nama': 'Mangga Harum Manis',
      'harga': 22000,
      'gambar': 'assets/images/mangga.png',
    },
    {
      'nama': 'Anggur Ungu',
      'harga': 25000,
      'gambar': 'assets/images/anggur.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  AppBar di bagian atas aplikasi
      appBar: AppBar(
        title: const Text('Toko Buah Albara'),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: [
          //  Tombol logout untuk kembali ke halaman login
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Keluar',
            onPressed: () {
              // Ketika tombol ditekan, pindah ke halaman Login
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
        ],
      ),

      //  Isi halaman (body)
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        //  Menampilkan daftar buah dengan ListView.builder
        child: ListView.builder(
          itemCount: fruits.length, // jumlah item berdasarkan data buah
          itemBuilder: (context, index) {
            final buah = fruits[index]; // ambil data buah ke-index
            return Card(
              // 💳 Setiap buah dibungkus dalam Card agar tampak rapi
              elevation: 4, // bayangan card
              margin: const EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                //  Menampilkan gambar buah dari assets
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    buah['gambar'], // ambil gambar dari data
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),

                // Nama buah
                title: Text(
                  buah['nama'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),

                //  Harga buah
                subtitle: Text(
                  'Harga: Rp ${buah['harga']} /kg',
                  style: const TextStyle(fontSize: 14),
                ),

                //  Tombol beli di bagian kanan
                trailing: ElevatedButton.icon(
                  onPressed: () {
                    //  Tampilkan notifikasi (SnackBar) ketika beli ditekan
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            'Kamu membeli ${buah['nama']} seharga Rp${buah['harga']}'),
                      ),
                    );
                  },
                  icon: const Icon(Icons.shopping_cart),
                  label: const Text('Beli'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 8),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
