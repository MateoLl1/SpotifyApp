


import 'package:flutter/material.dart';


class CustomLogo extends StatelessWidget {
  final double size;
  const CustomLogo({
    super.key, 
    required this.size
  });

  @override
  Widget build(BuildContext context) {
    return Image(
      image: const AssetImage('assets/img/spotify.png'),
      fit: BoxFit.cover,
      width: size,
    );
  }
}