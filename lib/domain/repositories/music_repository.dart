
import 'package:spotify/domain/domain.dart';

abstract class MusicRepository {
  
  // TODO CARGAR ALBUNES
  Future<List<Album>> getNewReleases({int limit = 10 , int offset = 0});
  
  // TODO CARGAR ARTISTA
  Future<Artist> getArtist( int  id );

}