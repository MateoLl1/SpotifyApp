

import 'package:spotify/domain/domain.dart';

class MusicRepositoryImpl extends MusicRepository {
  
  final MusicDatasource datasource;

  MusicRepositoryImpl({required this.datasource});

  @override
  Future<Artist> getArtist(int id) {
    return datasource.getArtist(id);
  }

  @override
  Future<List<Album>> getNewReleases({int limit = 10, int offset = 0}) {
    return datasource.getNewReleases(limit: limit, offset: offset);
  }
  
}