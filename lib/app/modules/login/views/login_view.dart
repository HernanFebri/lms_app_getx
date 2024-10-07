import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                // Wave di bawah logo
                ClipPath(
                  clipper: WaveClipper(),
                  child: Container(
                    height: 350, // Tinggi wave
                    color: Colors.yellow, // Warna wave
                  ),
                ),
                // Logo di atas wave
                Positioned(
                  top: 20,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/logo_login.png', // Ganti dengan path gambar logo
                        height: 300,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // Text "Masuk"
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Masuk',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // Input Email
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Masukkan Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Input Kata Sandi
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Kata Sandi',
                  hintText: 'Masukkan Kata Sandi',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: const Icon(Icons.visibility),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Checkbox "Simpan kata sandi" dan "Lupa kata sandi?"
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: (bool? value) {}),
                      const Text('Simpan kata sandi'),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Lupa kata sandi?',
                      style: TextStyle(color: Colors.yellow),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Tombol Masuk
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Masuk',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Text "Belum punya akun?" dan "Daftar"
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Belum punya akun?'),
                TextButton(
                  onPressed: () {
                    // Aksi ketika tombol "Daftar" ditekan
                  },
                  child: const Text(
                    'Daftar',
                    style: TextStyle(color: Colors.yellow),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Custom Clipper untuk Wave
class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    // Mulai dari kiri atas
    path.lineTo(0.0, size.height - 50);

    // Lengkungan pertama (cekung ke bawah)
    var firstControlPoint = Offset(
        size.width / 4, size.height - 100); // Kontrol lebih tinggi untuk cekung
    var firstEndPoint = Offset(
        size.width / 2, size.height - 50); // Akhir di posisi lebih tinggi
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    // Lengkungan kedua (cembung ke atas)
    var secondControlPoint = Offset(
        size.width * 0.75, size.height); // Kontrol lebih rendah untuk cembung
    var secondEndPoint =
        Offset(size.width, size.height - 50); // Akhir di posisi lebih rendah
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    // Garis ke ujung kanan atas
    path.lineTo(size.width, 0.0);

    // Tutup path
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
