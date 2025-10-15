import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'profile_screen.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  // Daftar buah dengan nama, harga, gambar, dan deskripsi
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
      // ==============================
      //  APPBAR (Judul & tombol kanan)
      // ==============================
      appBar: AppBar(
        title: const Text(
          'Toko Buah Albara',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: [
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

      // ==============================
      //  BODY UTAMA
      // ==============================
      body: Container(
        // Gradient di seluruh background halaman
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green.shade100, Colors.green.shade50],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
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

              // GridView daftar buah
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: fruits.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.85,
                  ),
                  itemBuilder: (context, index) {
                    final buah = fruits[index];
                    return Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.white, Colors.green.shade100],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
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
                              width: 110,
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

                          // Harga
                          Text(
                            'Rp ${buah['harga']} /kg',
                            style: TextStyle(
                              color: Colors.green.shade700,
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                          ),

                          // Deskripsi
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

                          // Tombol Beli
                          ElevatedButton.icon(
                            onPressed: () {
                              int jumlah = 1;

                              // Dialog konfirmasi pembelian
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    title:
                                        const Text('Konfirmasi Pembayaran'),
                                    content: StatefulBuilder(
                                      builder: (context, setState) {
                                        int harga =
                                            (buah['harga'] as int).toInt();
                                        int total = jumlah * harga;

                                        return Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                                'Kamu akan membeli ${buah['nama']} sebanyak:'),
                                            const SizedBox(height: 10),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                IconButton(
                                                  icon: const Icon(
                                                      Icons.remove_circle,
                                                      color: Colors.red),
                                                  onPressed: () {
                                                    if (jumlah > 1) {
                                                      setState(() => jumlah--);
                                                    }
                                                  },
                                                ),
                                                Text(
                                                  '$jumlah kg',
                                                  style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                IconButton(
                                                  icon: const Icon(
                                                      Icons.add_circle,
                                                      color: Colors.green),
                                                  onPressed: () {
                                                    setState(() => jumlah++);
                                                  },
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 10),
                                            Text('Total: Rp$total'),
                                          ],
                                        );
                                      },
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context),
                                        child: const Text('Batal'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          // Tampilkan notifikasi sukses
                                          showDialog(
                                            context: context,
                                            builder: (_) => AlertDialog(
                                              shape:
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                              title: const Text(
                                                  'Pembayaran Berhasil!'),
                                              content: Text(
                                                'Terima kasih telah membeli ${buah['nama']} sebanyak $jumlah kg.\nTotal: Rp${jumlah * (buah['harga'] as int)}',
                                                textAlign: TextAlign.center,
                                              ),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(context),
                                                  child: const Text('Tutup'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                        child: const Text('Bayar'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            icon: const Icon(
                              Icons.shopping_cart,
                              size: 18,
                              color: Colors.white,
                            ),
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
      ),

      // ==============================
      //  BOTTOM NAVIGATION BAR
      // ==============================
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() => _selectedIndex = index);
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Keluar',
          ),
        ],
      ),
    );
  }
}
