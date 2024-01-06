

import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  
  static String apiToken = dotenv.env['SPOTIFY_KEY'] ??  'SIN TOKEN';

}