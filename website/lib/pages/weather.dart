import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:website/model/weather_model.dart';
import 'package:website/service/weather_service.dart';
import 'package:website/pages/weather.dart';
import 'package:website/utils/colors.dart';
import 'package:website/model/weather_model.dart';
import 'package:website/widgets/navbar.dart';

class Weather extends StatefulWidget {
  const Weather({super.key});

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
//methods go here
final _weatherService = WeatherService('ca8fbbacbba4360a1acc35c558f693f0');

String cityName = "Dearborn";
var weather;

_fetchWeather() async{
  try{
    weather = await _weatherService.getWeather(cityName);
  }
  catch(e) {
    print(e);
  }
}

@override
void initState() {
  super.initState();
  _fetchWeather();
}

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      desktop: DesktopDashboard(),
      mobile: MobileDashboard()
    );
  }

Widget DesktopDashboard(){
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(color: AppColors.primary),
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 0, top: 20),
          child: Container(
            height: 420,
            width: double.infinity,
            decoration: BoxDecoration(),
            child: Column(
              children: <Widget>[
                Text('City: $cityName'),
                Text('Temperature: ${weather?.temperature.toInt().toString() ?? 'N/A'}°C'), //not null
                //Text('Temperature2: ${weather?.toString() ?? 'N/A'}°C'),
                //Text('Temperature3: ${weather?.weather?[0]?.main}'),
                Text('Description: ${weather?.weather?[0]?.description}'),
              ],
            ),
          ),
        ),
      ],
    )
  );
}



Widget MobileDashboard(){
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(color: AppColors.primary),
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 0, top: 20),
          child: Container(
            height: 195,
            width: double.infinity,
            decoration: BoxDecoration(
            ),
            child: Text(cityName),
          ),
        ),
      ],
    )
  );
}
}