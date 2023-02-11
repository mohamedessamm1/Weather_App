class weathermodel {
  String name; //
  String firstdate; //
  String seconddate; //
  String thirddate; //
  String fourdate; //
  String fivedate; //
  String firstdateicon; //
  String secondicon; //
  String thirdicon; //
  String fouricon; //
  String fiveicon; //
  String sixicon; //
  String sixdate; //
  String lastupdated; //
  double nowtemp_c; //
  double firsttemp_c; //
  double secondtemp_c; //
  double thirdtemp_c; //
  double fourthtemp_c; //
  double fivetemp_c; //
  double sixtemp_c; //
  String text; //
  String icon; //
  double wind_mph; //
  String region;
  double pressure_in;
  int cloud;
  int is_day;
  weathermodel({
    required this.name,
    required this.lastupdated,
    required this.nowtemp_c,
    required this.firsttemp_c,
    required this.secondtemp_c,
    required this.thirdtemp_c,
    required this.fourthtemp_c,
    required this.fivetemp_c,
    required this.sixtemp_c,
    required this.text,
    required this.icon,
    required this.wind_mph,
    required this.region,
    required this.pressure_in,
    required this.cloud,
    required this.is_day,
    required this.firstdate,
    required this.seconddate,
    required this.thirddate,
    required this.fourdate,
    required this.fivedate,
    required this.sixdate,
    required this.firstdateicon,
    required this.secondicon,
    required this.thirdicon,
    required this.fouricon,
    required this.fiveicon,
    required this.sixicon,
  });
  factory weathermodel.fromjson(Map<String, dynamic> data) {
    return weathermodel(
      name: data['location']['name'],
      lastupdated: data['current']['last_updated'],
      nowtemp_c: data['forecast']['forecastday'][0]['day']['maxtemp_c'],
      text: data['current']['condition']['text'],
      icon: data['current']['condition']['icon'],
      wind_mph: data['current']['wind_kph'],
      region: data['location']['region'],
      pressure_in: data['current']['pressure_in'],
      cloud: data['current']['cloud'],
      is_day: data['current']['is_day'],
      firsttemp_c: data['forecast']['forecastday'][1]['day']['maxtemp_c'],
      secondtemp_c: data['forecast']['forecastday'][2]['day']['maxtemp_c'],
      thirdtemp_c: data['forecast']['forecastday'][3]['day']['maxtemp_c'],
      fourthtemp_c: data['forecast']['forecastday'][4]['day']['maxtemp_c'],
      fivetemp_c: data['forecast']['forecastday'][5]['day']['maxtemp_c'],
      sixtemp_c: data['forecast']['forecastday'][6]['day']['maxtemp_c'],
      firstdate: data['forecast']['forecastday'][1]['date'],
      firstdateicon: data['forecast']['forecastday'][1]['day']['condition']
          ['icon'],
      secondicon: data['forecast']['forecastday'][2]['day']['condition']
          ['icon'],
      thirdicon: data['forecast']['forecastday'][3]['day']['condition']['icon'],
      fouricon: data['forecast']['forecastday'][4]['day']['condition']['icon'],
      fiveicon: data['forecast']['forecastday'][5]['day']['condition']['icon'],
      sixicon: data['forecast']['forecastday'][6]['day']['condition']['icon'],
      seconddate: data['forecast']['forecastday'][2]['date'],
      thirddate: data['forecast']['forecastday'][3]['date'],
      fourdate: data['forecast']['forecastday'][4]['date'],
      fivedate: data['forecast']['forecastday'][5]['date'],
      sixdate: data['forecast']['forecastday'][6]['date'],
    );
  }
}
