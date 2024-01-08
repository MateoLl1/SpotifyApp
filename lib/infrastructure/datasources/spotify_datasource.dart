import 'package:dio/dio.dart';
import 'package:spotify/config/config.dart';
import 'package:spotify/domain/domain.dart';
import 'package:spotify/infrastructure/infrastructure.dart';
import 'package:spotify/infrastructure/mappers/artist_mapper.dart';

final apiKey = Environment.apiToken;
class SpotifyDatasource extends MusicDatasource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.spotify.com/v1',
      headers: {'Authorization': 'Bearer $apiKey'},
    )
  );
  @override
  Future<Artist> getArtist(String id)async {
    final response = await dio.get('/artists/$id');
    final artistResponse = GetArtistResponse.fromJson(response.data);
    final newArtist = ArtistMapper.toEntityArtist(artistResponse);
    return newArtist;
  }

  @override
  Future<List<Album>> getNewReleases({int limit = 10, int offset = 0}) async {
    try {
      final response = await dio.get('/browse/new-releases',
          queryParameters: {'limit': '$limit', 'offset': '$offset'});

      final albumResponse = NewReleasesResponse.fromJson(response.data);
      final List<Album> newAlbums = albumResponse.albums.items
          .map((album) => MusicMapper.toEntityAlbum(album))
          .toList();
      return newAlbums;
    } catch (e) {
      return [];
    }
  }

  final errorAlbumLoadin = <Album>[
    Album(
      id: 'id',
      albumType: 'albumType',
      image: 'image',
      name: 'Error al cargar',
      releaseDate: 'releaseDate',
      totalTracks: 0,
      artist: []
    )
  ];
}
