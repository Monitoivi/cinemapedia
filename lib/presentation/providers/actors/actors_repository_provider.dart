import 'package:cinemapedia/infrestructure/repositories/actor_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../infrestructure/datasources/actor_moviedb_datasource_impl.dart';

final actorsRepositoryProvider = Provider((ref) {
  return ActorRepositoryImpl(ActorDatasourceIpml());
});
