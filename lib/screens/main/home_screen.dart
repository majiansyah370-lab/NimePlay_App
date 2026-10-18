import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../core/theme/neo_theme.dart';
import '../../core/widgets/neo_widgets.dart';
import '../../core/models/anime_model.dart';
import '../detail/detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NIMEPLAY'),
        actions: [
          IconButton(icon: const Icon(Icons.search, color: NeoColors.neonGreen), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // FILTER GENRE
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildFilterChip('All'),
                  _buildFilterChip('Action'),
                  _buildFilterChip('Romance'),
                  _buildFilterChip('Isekai'),
                  _buildFilterChip('Horror'),
                  _buildFilterChip('Movie'),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // SECTION POPULER
            Text('⭐ ANIME POPULER', style: GoogleFonts.poppins(fontWeight: FontWeight.w900, fontSize: 16, color: NeoColors.white)),
            const SizedBox(height: 12),
            SizedBox(
              height: 220,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dummyAnimeList.length,
                itemBuilder: (context, index) {
                  final anime = dummyAnimeList[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: NeoCard(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DetailScreen(anime: anime))),
                      child: SizedBox(
                        width: 140,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(topLeft: Radius.circular(6), topRight: Radius.circular(6)),
                                child: CachedNetworkImage(imageUrl: anime.thumbnail, width: double.infinity, fit: BoxFit.cover, errorWidget: (_, __, ___) => const Icon(Icons.broken_image)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(anime.title, maxLines: 2, overflow: TextOverflow.ellipsis, style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 12)),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      const Icon(Icons.star, color: NeoColors.neonYellow, size: 14),
                                      const SizedBox(width: 4),
                                      Text(anime.score, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),

            // SECTION ONGOING
            Text('🔥 ANIME ONGOING', style: GoogleFonts.poppins(fontWeight: FontWeight.w900, fontSize: 16, color: NeoColors.white)),
            const SizedBox(height: 12),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.6,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: dummyAnimeList.length,
              itemBuilder: (context, index) {
                final anime = dummyAnimeList[index];
                return NeoCard(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DetailScreen(anime: anime))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(6), topRight: Radius.circular(6)),
                          child: CachedNetworkImage(imageUrl: anime.thumbnail, width: double.infinity, fit: BoxFit.cover, errorWidget: (_, __, ___) => const Icon(Icons.broken_image)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6),
                        child: Text(anime.title, maxLines: 2, overflow: TextOverflow.ellipsis, style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 10)),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: NeoColors.surface,
        border: Border.all(color: NeoColors.neonPink, width: 1.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(child: Text(label, style: GoogleFonts.poppins(fontSize: 12, color: NeoColors.neonPink, fontWeight: FontWeight.bold))),
    );
  }
}
