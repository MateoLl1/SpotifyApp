
class Artist {

  final String id;
  final String name;
  final String typeArtist;
  final String? image;
  final int? popularity;
  final List<String>? genres;

  Artist({
    required this.id, 
    required this.name, 
    required this.typeArtist, 
    this.image, 
    this.popularity, 
    this.genres
  });
}
