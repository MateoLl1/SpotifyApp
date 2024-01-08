


import 'package:spotify/domain/domain.dart';
import 'package:spotify/infrastructure/infrastructure.dart';

class ArtistMapper {

  static Artist toEntityArtist (GetArtistResponse json) => Artist(
    id: json.id, 
    name: json.name, 
    typeArtist: json.type,
    genres: json.genres,
    image: json.images.first.url,
    popularity: json.popularity
  );
}