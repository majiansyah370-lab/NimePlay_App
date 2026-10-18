import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/neo_theme.dart';
import '../../core/widgets/neo_widgets.dart';
import '../main/main_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('NIMEPLAY', style: GoogleFonts.poppins(fontSize: 32, fontWeight: FontWeight.w900, color: NeoColors.neonGreen, letterSpacing: 2)),
              const SizedBox(height: 8),
              Text('Login ke akun MadzTools kamu', style: GoogleFonts.poppins(color: Colors.grey)),
              const SizedBox(height: 32),
              const NeoTextField(hint: 'Email / Username', icon: Icons.person),
              const SizedBox(height: 16),
              const NeoTextField(hint: 'Password', icon: Icons.lock, obscure: true),
              const SizedBox(height: 32),
              NeoButton(
                text: 'LOGIN',
                icon: Icons.login,
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const MainScreen()));
                },
              ),
              const SizedBox(height: 16),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: Text('Belum punya akun? Daftar', style: GoogleFonts.poppins(color: NeoColors.neonBlue)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
