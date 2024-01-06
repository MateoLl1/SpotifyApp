
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotify/domain/domain.dart';
import 'package:spotify/presentation/providers/providers.dart';


final albumsProvider = StateNotifierProvider<AlbumsNotifier,List<Album>>((ref) {
  final fetchMoreMusic = ref.watch(repositoryProvider).getNewReleases;
  return AlbumsNotifier(
    fetchMoreMusic: fetchMoreMusic
  );
});

typedef MusicCallback = Future<List<Album>> Function({int limit , int offset});

class AlbumsNotifier extends StateNotifier<List<Album>> {
  final MusicCallback fetchMoreMusic;
  AlbumsNotifier({
    required this.fetchMoreMusic
  }):super([]);

  int offset = 1;

  Future<void> loadNextAlbums() async {
    if (offset >= 100) return;
    final albums = await fetchMoreMusic(offset: offset, limit: 20);
    state = [...state, ...albums];
    offset = offset + 20 -1;
  }

}