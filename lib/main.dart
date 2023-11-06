import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() {
  runApp(const MyApp());
}

class WeatherData {
  final String city;
  final int temperature;
  final String condition;
  final int humidity;
  final double windSpeed;

  WeatherData(this.city, this.temperature, this.condition, this.humidity, this.windSpeed);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      home: WeatherList(),
    );
  }
}

class WeatherList extends StatefulWidget {
  const WeatherList({Key? key}) : super(key: key);

  @override
  _WeatherListState createState() => _WeatherListState();
}

class _WeatherListState extends State<WeatherList> {
  List<WeatherData> weatherData = [];

  @override
  void initState() {
    getweatherdata();
    super.initState();
  }
  Future<void>getweatherdata()async{
    List<dynamic> jsonWeatherData = jsonDecode(jsonData) ;
    for(var weather in jsonWeatherData){
      weatherData.add(WeatherData(
        weather['city'],
        weather['temperature'],
        weather['condition'],
        weather['humidity'],
        weather['windSpeed']
      ));
    }
    setState(() {
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Info App'),
      ),
      body: ListView.builder(
        itemCount: weatherData.length,
        itemBuilder: (BuildContext context, int index) {
          final data = weatherData[index];
          return Card(
            child: ListTile(
            title: Text("City:${data.city}"),
            subtitle: Text(
              'Temperature: ${data.temperature}°C\nCondition: ${data.condition}\nHumidity: ${data.humidity}%\nWind Speed: ${data.windSpeed} km/h',
            ),
           ),
          );
        },
      ),
    );
  }
}

const String jsonData = '''
[
  {
    "city": "New York",
    "temperature": 20,
    "condition": "Clear",
    "humidity": 60,
    "windSpeed": 5.5
  },
  {
    "city": "Los Angeles",
    "temperature": 25,
    "condition": "Sunny",
    "humidity": 50,
    "windSpeed": 6.8
  },
  {
    "city": "London",
    "temperature": 15,
    "condition": "Partly Cloudy",
    "humidity": 70,
    "windSpeed": 4.2
  },
  {
    "city": "Tokyo",
    "temperature": 28,
    "condition": "Rainy",
    "humidity": 75,
    "windSpeed": 8.0
  },
  {
    "city": "Sydney",
    "temperature": 22,
    "condition": "Cloudy",
    "humidity": 55,
    "windSpeed": 7.3
  }
]
''';
