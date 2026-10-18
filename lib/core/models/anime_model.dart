class Anime {
  final String id;
  final String title;
  final String thumbnail;
  final String score;
  final String status;
  final String type;

  Anime({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.score,
    required this.status,
    required this.type,
  });
}

// Dummy Data buat ngetes UI
List<Anime> dummyAnimeList = [
  Anime(id: '1', title: 'Jujutsu Kaisen S2', thumbnail: 'https://cdn.myanimelist.net/images/anime/1792/138022.jpg', score: '8.8', status: 'Ongoing', type: 'TV'),
  Anime(id: '2', title: 'One Piece', thumbnail: 'https://cdn.myanimelist.net/images/anime/6/73245.jpg', score: '8.7', status: 'Ongoing', type: 'TV'),
  Anime(id: '3', title: 'Solo Leveling', thumbnail: 'https://cdn.myanimelist.net/images/anime/1925/139534.jpg', score: '8.2', status: 'Completed', type: 'TV'),
  Anime(id: '4', title: 'Frieren: Beyond Journey\'s End', thumbnail: 'https://cdn.myanimelist.net/images/anime/1015/138006.jpg', score: '9.1', status: 'Completed', type: 'TV'),
  Anime(id: '5', title: 'Demon Slayer: Hashira Training', thumbnail: 'https://cdn.myanimelist.net/images/anime/1908/135431.jpg', score: '8.6', status: 'Ongoing', type: 'TV'),
  Anime(id: '6', title: 'Your Name', thumbnail: 'https://cdn.myanimelist.net/images/anime/5/87048.jpg', score: '8.4', status: 'Completed', type: 'Movie'),
];
