
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotify/domain/entities/artist.dart';
import 'package:spotify/presentation/providers/providers.dart';

class SingleScreen extends ConsumerStatefulWidget {
  final String id;
  const SingleScreen({
    super.key, 
    required this.id, 
  });

  @override
  SingleScreenState createState() => SingleScreenState();
}

class SingleScreenState extends ConsumerState<SingleScreen> {

  @override
  void initState() {
    super.initState();
    ref.read(infoArtistProvider.notifier).loadInfoArtist(widget.id);
  }


  @override
  Widget build(BuildContext context) {
    final artist = ref.watch(infoArtistProvider)[widget.id];
    final textStyle = Theme.of(context).textTheme;
    if (artist == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: DecoratedBox(
              decoration: const BoxDecoration(
                color: Colors.black38
              ),
              child: 
              _Image(artist: artist)
            ),
          ),


          Text(artist.name,style: textStyle.titleLarge,),

          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(artist.typeArtist.toUpperCase(),style: textStyle.titleLarge,),
              ...artist.genres!.map(
                (e) => _ListGenres(label: e,)
              ).toList()
          
            ],
          )
        ],
      )
    );
  }
}

class _ListGenres extends StatelessWidget {
  final String label;
  const _ListGenres({required this.label});


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: FilledButton(
        onPressed: (){},
        child: Text(label), 
      ),
    );
  }
}

class _Image extends StatelessWidget {
  const _Image({
    required this.artist,
  });

  final Artist artist;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      artist.image!,
      width: double.infinity,
      height: 400,
      fit: BoxFit.cover,
    );
  }
}