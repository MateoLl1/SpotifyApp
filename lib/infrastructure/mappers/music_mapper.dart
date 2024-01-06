import 'package:spotify/domain/domain.dart';
import 'package:spotify/infrastructure/infrastructure.dart';

class MusicMapper {
  static Album toEntityAlbum(Item json) => Album(
    id: json.id,
    albumType: json.albumType.name,
    image: json.images.first.url,
    name: json.name,
    releaseDate: json.releaseDate.timeZoneName,
    totalTracks: json.totalTracks,
    artist: json.artists.map((e) => Artist(
        id: e.id, 
        name: e.name, 
        typeArtist: e.type.name,
      )
    ).toList()

  );
}
