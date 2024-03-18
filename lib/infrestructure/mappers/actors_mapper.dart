import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infrestructure/models/credits_response.dart';

class ActorMapper {
  static Actor castToEntity(Cast cast) => Actor(
        id: cast.id,
        name: cast.name,
        profilePath: cast.profilePath ??
            "https://static.displate.com/324x454/displate/2022-04-15/7422bfe15b3ea7b5933dffd896e9c7f9_46003a1b7353dc7b5a02949bd074432a.avif",
        character: cast.character,
      );
}
