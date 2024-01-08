import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify/presentation/providers/providers.dart';
import 'package:spotify/presentation/widgets/widgets.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: Column(
        children: [

          _TitleBar(),

          _HomeView(),

          SizedBox(height: 5,)
        ],
      ),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  final controller = ScrollController();

  @override
  void initState() {
    super.initState();
    ref.read(albumsProvider.notifier).loadNextAlbums();
    controller.addListener(() { 
      final position = controller.position.pixels;
      final maxPos = controller.position.maxScrollExtent;

      if (position == maxPos) {
        ref.read(albumsProvider.notifier).loadNextAlbums();
      }

    });
  }

  

  @override
  Widget build(BuildContext context) {
    final albums = ref.watch(albumsProvider);
    return albums.isNotEmpty ? Expanded(
      child: GridView.builder(
        controller: controller,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0, // Espacio horizontal entre elementos
          mainAxisSpacing: 8.0, // Espacio vertical entre elementos
        ),
        itemCount: albums.length,
        itemBuilder: (BuildContext context, int index) {
          final album = albums[index];
          return GestureDetector(
            child: AlbumCard(album: album),
            onTap: () {
              context.push('/single/${album.artist[0].id}');
            },
          );
        },
      ),
    ): const Center(child: CircularProgressIndicator());
  }
}

class _TitleBar extends StatelessWidget {
  const _TitleBar();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomLogo(size: 50),
          Text('Spotify App',style: TextStyle(fontSize: 30),)
        ],
      ),
    );
  }
}