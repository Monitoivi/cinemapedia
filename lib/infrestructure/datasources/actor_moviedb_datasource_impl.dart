import 'package:cinemapedia/config/constans/environment.dart';
import 'package:cinemapedia/domain/datasources/actors_datasource.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infrestructure/mappers/actors_mapper.dart';
import 'package:cinemapedia/infrestructure/models/credits_response.dart';

import 'package:dio/dio.dart';

class ActorDatasourceIpml extends ActorsDatasource {
  @override
  Future<List<Actor>> getActorByMovie(String movieId) async {
    final dio = Dio(
      BaseOptions(
        baseUrl: "https://api.themoviedb.org/3",
        queryParameters: {
          "api_key": Environment.movieDBkey,
          "language": "es-MX"
        },
      ),
    );

    final response = await dio.get("/movie/$movieId/credits");
    final credits = CreditsResponse.fromJson(response.data);

    final actors =
        credits.cast.map((actors) => ActorMapper.castToEntity(actors)).toList();

    return actors;
  }
}
