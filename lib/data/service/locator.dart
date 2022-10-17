import 'package:get_it/get_it.dart';
import 'package:rest_api_demo/data/network_calls/http_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../storage/shared_prefrences_helper.dart';

final getIt = GetIt.instance;

Future<void> setUp() async
{
  final _prefs = await SharedPreferences.getInstance();
   getIt.registerSingleton<SharedPreferenceHelper>(
     SharedPreferenceHelper(prefs: _prefs),
   );
  getIt.registerSingleton<HttpClient>(HttpClient());
}