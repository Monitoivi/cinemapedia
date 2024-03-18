import 'package:cinemapedia/infrestructure/datasources/moviedb_datasource_impl.dart';
import 'package:cinemapedia/infrestructure/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(MovieDBDatasourceIMPL());
});
