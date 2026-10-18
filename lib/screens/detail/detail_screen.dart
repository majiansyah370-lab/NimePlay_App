import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../core/theme/neo_theme.dart';
import '../../core/widgets/neo_widgets.dart';
import '../../core/models/anime_model.dart';

class DetailScreen extends StatelessWidget {
  final Anime anime;

  const DetailScreen({super.key, required this.anime});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(anime.title)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HEADER IMAGE
            Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: anime.thumbnail,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorWidget: (_, __, ___) => Container(height: 250, color: NeoColors.surface, child: const Icon(Icons.broken_image)),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 100,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.transparent, NeoColors.bg]),
                    ),
                  ),
                ),
              ],
            ),
            
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(anime.title, style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w900, color: NeoColors.white)),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(color: NeoColors.neonGreen, borderRadius: BorderRadius.circular(4)),
                        child: Text(anime.type, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12)),
                      ),
                      const SizedBox(width: 8),
                      Text(anime.status, style: const TextStyle(color: NeoColors.neonBlue, fontWeight: FontWeight.bold)),
                      const SizedBox(width: 16),
                      const Icon(Icons.star, color: NeoColors.neonYellow, size: 18),
                      const SizedBox(width: 4),
                      Text(anime.score, style: const TextStyle(color: Colors.white)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text('Sinopsis', style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: NeoColors.white, fontSize: 16)),
                  const SizedBox(height: 8),
                  const Text('Ini adalah deskripsi dummy. Di versi real, data ini diambil dari MAL/AniList API. Menceritakan tentang petualangan seorang protagonis yang kuat melawan musuh-musuhnya.', style: TextStyle(color: Colors.grey)),
                  const SizedBox(height: 24),

                  // EPISODE LIST
                  Text('Daftar Episode', style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: NeoColors.white, fontSize: 16)),
                  const SizedBox(height: 12),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: NeoCard(
                          onTap: () => _showPlayer(context),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Episode ${index + 1}', style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: Colors.white)),
                                const Icon(Icons.play_circle_fill, color: NeoColors.neonGreen, size: 30),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 24),
                  // TOMBOL DOWNLOAD
                  NeoButton(
                    text: 'DOWNLOAD BATCH',
                    icon: Icons.download,
                    color: NeoColors.neonBlue,
                    onPressed: () {},
                  ),
                  const SizedBox(height: 12),
                  NeoButton(
                    text: 'BOOKMARK ANIME',
                    icon: Icons.bookmark_add,
                    color: NeoColors.neonPink,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showPlayer(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(10),
        child: Container(
          height: 250,
          width: double.infinity,
          decoration: BoxDecoration(color: NeoColors.surface, border: Border.all(color: NeoColors.neonGreen, width: 2), borderRadius: BorderRadius.circular(12)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.play_circle, size: 80, color: NeoColors.neonGreen),
              const SizedBox(height: 16),
              Text('Video Player Placeholder', style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: ['Server 1', 'Server 2', '480p', '720p'].map((e) => Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(color: NeoColors.bg, border: Border.all(color: NeoColors.neonBlue), borderRadius: BorderRadius.circular(4)),
                    child: Text(e, style: const TextStyle(color: NeoColors.neonBlue, fontSize: 10)),
                  )).toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
