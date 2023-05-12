// ignore_for_file: prefer_const_declarations, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _city = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String weatherData = 'Loading...';

  @override
  void initState() {
    super.initState();
    fetchWeatherData();
  }

  Future<void> fetchWeatherData() async {
    String apiKey = 'UvJkdtQeGUENmtog';

    final url =
        'https://v1.nocodeapi.com/ridaprivt/ow/$apiKey/byCityName?q=${_city.text}';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);

        final cityName = jsonData['name'];
        final weather = jsonData['weather'][0]['description'];
        final temperature = jsonData['main']['temp'];
        final pressure = jsonData['main']['pressure'];
        final humidity = jsonData['main']['humidity'];

        setState(() {
          weatherData =
              'City: $cityName\nTemperature: $temperature\nDescription: $weather\nPressure: $pressure\nHumidity: $humidity';
        });
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (error) {
      throw Exception('Failed to connect to the weather API');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(7.w, 4.h, 7.w, 4.h),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Good Morning',
                        style: GoogleFonts.lato(
                            color: Color.fromARGB(255, 3, 60, 106),
                            textStyle: TextStyle(
                                fontSize: 19.sp, fontWeight: FontWeight.w900))),
                    SizedBox(height: 2.h),
                    Text('Nearly Perfect Map based Weather!',
                        style: GoogleFonts.lato(
                            color: Colors.grey,
                            textStyle: TextStyle(
                                fontSize: 15.sp, fontWeight: FontWeight.w500))),
                  ],
                ),
                Image.asset(
                  'assets/drawerDp.png',
                  height: 6.h,
                )
              ],
            ),
            SizedBox(height: 4.h),
            Form(
              key: _formKey,
              child: TextFormField(
                controller: _city,
                style: TextStyle(color: Colors.grey),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your City';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Enter City Name',
                  labelStyle: TextStyle(
                    color: Colors.grey[400],
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 204, 204, 204)),
                    borderRadius: BorderRadius.circular(15.sp),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 204, 204, 204),
                    ),
                    borderRadius: BorderRadius.circular(15.sp),
                  ),
                ),
              ),
            ),
            SizedBox(height: 2.h),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  fetchWeatherData();
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF5AC2DA),
                onPrimary: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 10.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.sp),
                ),
              ),
              child: Text(
                'Search',
                style: GoogleFonts.lato(
                  color: Color.fromARGB(255, 255, 255, 255),
                  textStyle: TextStyle(
                    fontSize: 19.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(height: 4.h),
            Container(
              padding: EdgeInsets.fromLTRB(6.w, 5.h, 6.w, 5.h),
              decoration: BoxDecoration(
                color: Color.fromARGB(216, 181, 227, 238),
                borderRadius: BorderRadius.all(Radius.circular(21.sp)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Weather:',
                    style: GoogleFonts.lato(
                      color: Color.fromARGB(255, 3, 60, 106),
                      textStyle: TextStyle(
                        fontSize: 19.sp,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    weatherData,
                    style: GoogleFonts.lato(
                      color: Color.fromARGB(255, 106, 106, 106),
                      fontWeight: FontWeight.w500,
                      textStyle: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
