import 'package:flutter/material.dart';
import 'package:lms_app_getx/app/utils/app_color.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header dengan warna latar belakang
          Container(
            margin: EdgeInsets.only(top: 25),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: AppColors.primary, // Ganti warna sesuai keinginan
              borderRadius: BorderRadius.circular(18.0), // Radius untuk sudut
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 40, backgroundColor: AppColors.background,
                      backgroundImage: AssetImage(
                          'assets/images/profile.png'), // Ganti dengan gambar profil Anda
                    ),
                    SizedBox(width: 20),
                    Text(
                      'Hai, Hernan Febri',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // Ubah warna teks agar kontras
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ListTile(
            title: const Text(
              'Pengaturan Akun',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            subtitle: Column(
              children: [
                ListTile(
                  title: const Text('Ubah Profil'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text('Ubah Bahasa'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text('Unduhan'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {},
                ),
              ],
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text(
              'Lainnya',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            subtitle: Column(
              children: [
                ListTile(
                  title: const Text('Pusat Bantuan'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text('Kebijakan Privasi'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text('Ketentuan Pengguna'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text('Laporkan Masalah'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text('Versi Aplikasi'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text('Tentang Kami'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
