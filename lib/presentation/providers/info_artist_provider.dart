
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotify/domain/domain.dart';
import 'package:spotify/presentation/providers/providers.dart';

final infoArtistProvider = StateNotifierProvider<ArtistNotifier,Map<String,Artist>>((ref) {
  final fetchMoreArtist = ref.watch(repositoryProvider).getArtist;
  return ArtistNotifier(fetchMoreArtist: fetchMoreArtist);
});



typedef ArtistCallback = Future<Artist> Function(String id);

class ArtistNotifier extends StateNotifier<Map<String,Artist>> {
  final ArtistCallback fetchMoreArtist;
  ArtistNotifier({ 
    required this.fetchMoreArtist
  }
  ):super({});
  
  Future<void> loadInfoArtist(String id)async{
    final artist = await fetchMoreArtist(id);
    state = {...state, id:artist};
  }

}