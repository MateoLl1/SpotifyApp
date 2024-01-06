
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotify/infrastructure/infrastructure.dart';

final repositoryProvider = Provider<MusicRepositoryImpl>((ref) {
  final repositoryImpl = MusicRepositoryImpl(datasource: SpotifyDatasource());
  return repositoryImpl;
});