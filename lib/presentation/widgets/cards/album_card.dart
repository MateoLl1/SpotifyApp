
import 'package:flutter/material.dart';
import 'package:spotify/domain/domain.dart';

class AlbumCard extends StatelessWidget {
  final Album album;
  const AlbumCard({super.key, required this.album});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.black45,
        ),
        height: 300,
        child: Column(
          children: [
        
            Image.network(
              album.image,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 160,
            ),
        
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  album.name.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 17,
                  ),
                ),
              )
            )
        
          ],
        ),
      ),
    );
  }
}