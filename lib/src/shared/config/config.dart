import 'dart:io';
import 'dart:convert';

import 'package:injectable/injectable.dart';

@singleton
class Config {
  final String apiKey;

  Config(this.apiKey);

  @factoryMethod
  static Future<Config> create() async {
    final configFile = File('config.json');
    final jsonString = await configFile.readAsString();
    final dynamic jsonMap = jsonDecode(jsonString);

    return Config(jsonMap["apiKey"]);
  }
}
