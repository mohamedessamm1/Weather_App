import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/layout/layout_screen/layout_screen.dart';
import 'package:weather/network/cache/cache.dart';
import 'package:weather/network/services.dart';
import 'package:weather/shared/model.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';

class searchscreen extends StatefulWidget {
  @override
  State<searchscreen> createState() => _searchscreenState();
}

class _searchscreenState extends State<searchscreen> {
  Color main = const Color(0xFF8DA4FF);
  String? city;
  String? country;
  String? state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  const Color(0xFF3366DF),
                  const Color(0xFF8DA1FF),
                ],
                begin: const FractionalOffset(0.0, 1),
                end: const FractionalOffset(0.0, 0.0),
                stops: [0.1, 1.0],
                tileMode: TileMode.clamp),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 180.h,
              ),
              Text('where you from ?',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                      color: Colors.white)),
              Padding(
                padding: EdgeInsets.all(20.0.r),
                child: Column(
                  children: [
                    SelectState(
                      onCountryChanged: (value) {
                        setState(() {
                          country = value;
                        });
                      },
                      onStateChanged: (value) {
                        setState(() {
                          state = value;
                        });
                      },
                      onCityChanged: (value) {
                        setState(() {
                          city = value;
                        });
                      },
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        services serv = services();
                        weathermodel model = await serv.getweather(
                            countryname: city == null ? city = 'mansoura' : city);
                        weatherdata = model;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => layout_screen()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Search',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(200.w, 25.h),
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r))),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

weathermodel? weatherdata;
