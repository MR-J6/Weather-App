class WeatherModel {
  String date;
  double temp;
  int cloud;
  double wind;
  int humidity;
  int code;
  WeatherModel({
    required this.date,
    required this.temp,
    required this.cloud,
    required this.wind,
    required this.humidity,
    required this.code
  });

  factory WeatherModel.fromJson(dynamic jsonData) {
    // date = jsonData['location']['localtime'];
    // temp = jsonData['current']['temp_c'];
    // cloud = jsonData['current']['cloud'];
    // wind = jsonData['current']['wind_kph'];
    // humidity = jsonData['current']['humidity'];

    return WeatherModel(
      date: jsonData['location']['localtime'],
      temp: jsonData['current']['temp_c'],
      cloud: jsonData['current']['cloud'],
      wind: jsonData['current']['wind_kph'],
      humidity: jsonData['current']['humidity'],
      code:  jsonData['current']['condition']['code'],
    );
  }

  @override
  String toString() {
    return 'date : $date  \n temp : $temp \n cloud : $cloud \n wind : $wind \n humidity : $humidity code : $code';
  }
}
