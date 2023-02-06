import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather/shared/model.dart';
//http://api.weatherapi.com/v1/forecast.json?key=f560f1d9ce8441c39ad23745230602&q=07112&days=7
class services {
  String baseurl = 'http://api.weatherapi.com/';
  String apikey = 'key=f560f1d9ce8441c39ad23745230602';
  Future<weathermodel> getweather({required countryname}) async {
    Uri url = Uri.parse('${baseurl}v1/forecast.json?${apikey}&q=${countryname.toString()}&days=7');
    http.Response response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);
    weathermodel model = weathermodel.fromjson(data);
    print(url);
    return model;

  }
}
