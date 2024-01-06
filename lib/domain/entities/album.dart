import 'package:spotify/domain/domain.dart';

class Album {
  final String id;
  final String albumType;
  final String image;
  final String name;
  final String releaseDate;
  final int totalTracks;
  final List<Artist> artist;

  Album({
    required this.id,
    required this.albumType,
    required this.image,
    required this.name,
    required this.releaseDate,
    required this.totalTracks,
    required this.artist
  });
}
