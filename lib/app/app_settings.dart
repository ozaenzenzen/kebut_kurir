import 'package:kebut_kurir/core/enums/environment_enums.dart';

class Settings {
  Settings();
  static Environment env = Environment.production;
  static String apiKey = '09Icz1KZSdkIptlIQ6LKv22';
  static String domain = env == Environment.production ? 'https://carforent.is-global.com/' : 'https://carforent.is-global.com/';
}
