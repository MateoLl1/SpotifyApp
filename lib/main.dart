import 'package:flutter/material.dart';
import 'package:spotify/config/config.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      title: 'Spotify app',
      theme: AppTheme().getTheme(),
      debugShowCheckedModeBanner: false,
    );
  }
}