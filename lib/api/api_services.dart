import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:islami_app/tabs/radio/radio_model/radio_model.dart';

class ApiServices {
  static Future<RadioModel> getRadios() async {
    var url = Uri.https('mp3quran.net', 'api/v3/radios', {'language': 'eng'});
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    return RadioModel.fromJson(json);
  }
}
