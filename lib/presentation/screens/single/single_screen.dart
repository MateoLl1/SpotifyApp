
import 'package:flutter/material.dart';

class SingleScreen extends StatelessWidget {
  final String id;
  const SingleScreen({
    super.key, 
    required this.id, 
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Text(id),

        ],
      )
    );
  }
}