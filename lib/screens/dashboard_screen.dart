import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'profile_screen.dart'; // import halaman profil

class DashboardScreen extends StatelessWidget {
  // Daftar buah: nama, harga, gambar, deskripsi singkat
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

  // Fungsi untuk menampilkan dialog input jumlah pembelian
  void _tampilDialogBeli(BuildContext context, Map<String, dynamic> buah) {
    final TextEditingController jumlahController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Beli ${buah['nama']}"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Harga per kg: Rp ${buah['harga']}"),
            const SizedBox(height: 10),
            TextField(
              controller: jumlahController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Masukkan jumlah (kg)",
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Batal"),
          ),
          ElevatedButton(
            onPressed: () {
              int jumlah = int.tryParse(jumlahController.text) ?? 0;
              if (jumlah <= 0) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Masukkan jumlah yang valid!")),
                );
                return;
              }
              int total = buah['harga'] * jumlah;
              Navigator.pop(context);
              _tampilKonfirmasi(context, buah, jumlah, total);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            child: const Text("Lanjut"),
          ),
        ],
      ),
    );
  }

  // Fungsi menampilkan konfirmasi pembayaran
  void _tampilKonfirmasi(
      BuildContext context, Map<String, dynamic> buah, int jumlah, int total) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Konfirmasi Pembelian"),
        content: Text(
          "Nama Buah: ${buah['nama']}\n"
          "Jumlah: $jumlah kg\n"
          "Total Harga: Rp $total",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Batal"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text(
                        "Pembelian ${buah['nama']} sebanyak $jumlah kg berhasil!")),
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            child: const Text("Bayar Sekarang"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,

      // AppBar di bagian atas halaman
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

          // Tombol logout (kembali ke login)
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

      // Bagian utama (daftar buah)
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header toko di atas daftar buah
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
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: fruits.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // dua kolom
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.85,
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Gambar buah
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            buah['gambar'],
                            width: 110, // sedikit lebih kecil agar proporsional
                            height: 110,
                            fit: BoxFit.contain, // agar gambar tidak terpotong
                          ),
                        ),
                        const SizedBox(height: 8),

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

                        // Deskripsi singkat
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          child: Text(
                            buah['deskripsi'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                            ),
                          ),
                        ),

                        // Tombol beli
                        ElevatedButton.icon(
                          onPressed: () => _tampilDialogBeli(context, buah),
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
