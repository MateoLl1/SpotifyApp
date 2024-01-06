import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotify/presentation/providers/albums_provider.dart';


class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreen> {

  final controller = ScrollController();

  @override
  void initState() {
    super.initState();
    ref.read(albumsProvider.notifier).loadNextAlbums();
    
    controller.addListener(() { 
      final position = controller.position.pixels;
      final page = controller.position.maxScrollExtent;

      if (position >= page) {
        print('Cargando nueva data');
        ref.read(albumsProvider.notifier).loadNextAlbums();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final albums = ref.watch(albumsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Spotify app'),
      ),
      body: albums.isNotEmpty 
        ? ListView.builder(
          controller: controller,
          itemCount: albums.length,
          itemBuilder: (context, index) {
            final album = albums[index];
            return ListTile(
              title: Text(album.name),
              subtitle: Text('index: $index'),
              
            );
          },
        )
        : const  Center(child: CircularProgressIndicator())
    );
  }
}