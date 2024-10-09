import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/waveclipper_widget.dart';
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
                ClipPath(
                  clipper:
                      WaveClipper(), // Menambahkan ClipPath dengan WaveClipper
                  child: Container(
                    height: 350,
                    color: Colors.yellow,
                    child: Center(
                      child: Image.asset(
                        'assets/images/logo_login.png',
                        height: 300,
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                  ),
                ),
              ],
            ),
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
            const SizedBox(height: 20),
            Form(
              key: controller.formKey,
              child: Column(
                children: [
                  // Input Email
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: TextFormField(
                      controller: controller.emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Masukkan Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: controller.validateEmail,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Input Kata Sandi
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Obx(() => TextFormField(
                          controller: controller.passwordController,
                          obscureText: controller.isPasswordHidden.value,
                          decoration: InputDecoration(
                            labelText: 'Kata Sandi',
                            hintText: 'Masukkan Kata Sandi',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            // Ikon untuk toggle visibility
                            suffixIcon: IconButton(
                              icon: Icon(
                                controller.isPasswordHidden.value
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: controller.togglePasswordVisibility,
                            ),
                          ),
                          validator: controller.validatePassword,
                        )),
                  ),
                  const SizedBox(height: 5),
                  // Checkbox "Simpan kata sandi" dan "Lupa kata sandi?"
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Obx(() => Checkbox(
                                  value: controller.rememberMe.value,
                                  onChanged: (bool? value) {
                                    controller.rememberMe.value = value!;
                                  },
                                )),
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
                      onPressed: controller.login,
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
                  const SizedBox(height: 10),
                  // Text "Belum punya akun?" dan "Daftar"
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Belum punya akun?'),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(
                              '/register'); // Rute untuk halaman pendaftaran
                        },
                        child: const Text(
                          'Daftar',
                          style: TextStyle(
                              color: Colors.yellow,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
