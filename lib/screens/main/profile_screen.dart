import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/neo_theme.dart';
import '../../core/widgets/neo_widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PROFIL USER'), actions: [
        IconButton(icon: const Icon(Icons.logout, color: NeoColors.neonRed), onPressed: () => Navigator.pushReplacementNamed(context, '/')),
      ]),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // AVATAR & INFO
            Center(
              child: Column(
                children: [
                  Container(
                    width: 100, height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: NeoColors.neonGreen, width: 3),
                      image: const DecorationImage(image: NetworkImage('https://ui-avatars.com/api/?name=Madz&background=00FF41&color=000'), fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text('MadzUser', style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(color: NeoColors.neonBlue, borderRadius: BorderRadius.circular(20)),
                    child: const Text('USER PRO', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // STATISTIK
            Row(
              children: [
                Expanded(child: _buildStatCard('Bookmark', '12')),
                const SizedBox(width: 12),
                Expanded(child: _buildStatCard('History', '45')),
              ],
            ),
            const SizedBox(height: 24),

            // MENU LIST
            _buildMenuItem(Icons.history, 'Riwayat Tontonan', NeoColors.neonBlue),
            const SizedBox(height: 12),
            _buildMenuItem(Icons.bookmark, 'Daftar Bookmark', NeoColors.neonPink),
            const SizedBox(height: 12),
            _buildMenuItem(Icons.settings, 'Pengaturan Akun', NeoColors.neonYellow),
            const SizedBox(height: 12),
            
            // ADMIN PANEL (Hanya muncul kalau Admin)
            NeoCard(
              color: NeoColors.neonRed,
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    const Icon(Icons.admin_panel_settings, color: Colors.black, size: 30),
                    const SizedBox(width: 16),
                    Text('ADMIN PANEL', style: GoogleFonts.poppins(fontWeight: FontWeight.w900, color: Colors.black)),
                    const Spacer(),
                    const Icon(Icons.arrow_forward_ios, color: Colors.black, size: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String count) {
    return NeoCard(
      color: NeoColors.surface,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(count, style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w900, color: NeoColors.neonGreen)),
            const SizedBox(height: 4),
            Text(title, style: const TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, Color color) {
    return NeoCard(
      color: NeoColors.surface,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(width: 16),
            Text(title, style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: Colors.white)),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
          ],
        ),
      ),
    );
  }
}
