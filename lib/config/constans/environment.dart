import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String movieDBkey = dotenv.env["THE_MOVIEDB_KEY"] ?? "no hay api key";
}
