import 'package:csc_picker/csc_picker.dart';
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
      backgroundColor: Colors.transparent,
      body: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  const Color(0xFF1e5171),
                  const Color(0xFF8DA1FF),
                ],
                begin: const FractionalOffset(1, .83),
                end: const FractionalOffset(.50, 1.0),
                stops: [0.1, 1.0],
                tileMode: TileMode.clamp),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on_sharp,
                size: 90,
                color: Colors.blue.shade800,
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
                    CSCPicker(
                      defaultCountry: CscCountry.Egypt,
                      showStates: true,
                      showCities: true,
                      flagState: CountryFlag.ENABLE,
                      dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.r)),
                          color: Colors.white,
                          border: Border.all(
                              color: Colors.grey.shade300, width: 1.w)),
                      disabledDropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.r)),
                          color: Colors.grey.shade300,
                          border: Border.all(
                              color: Colors.grey.shade300, width: 1.w)),
                      countrySearchPlaceholder: "Country",
                      stateSearchPlaceholder: "State",
                      citySearchPlaceholder: "City",
                      countryDropdownLabel: "*Country",
                      stateDropdownLabel: "*State",
                      cityDropdownLabel: "*City",
                      disableCountry: false,
                      selectedItemStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
                      ),
                      dropdownHeadingStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold),
                      dropdownItemStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
                      ),
                      dropdownDialogRadius: 10.0.r,
                      searchBarRadius: 10.0.r,
                      onCountryChanged: (value) {
                        setState(() {
                          country = value.toString();
                        });
                      },
                      onStateChanged: (value) {
                        setState(() {
                          state = value.toString();
                        });
                      },
                      onCityChanged: (value) {
                        setState(() {
                          city = value.toString();
                        });
                      },
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    InkWell(
                      onTap: () async {
                        services serv = services();
                        weathermodel model =
                            await serv.getweather(countryname: city);
                        weatherdata = model;
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) => layout_screen(),
                            transitionDuration: Duration(milliseconds: 300),
                            transitionsBuilder: (_, a, __, c) =>
                                FadeTransition(opacity: a, child: c),
                          ),
                        );
                      },
                      child: Container(
                        height: 50.h,
                        width: 150.w,
                        child: Center(
                            child: Text(
                          'Search',
                          style: TextStyle(fontSize: 20.sp),
                        )),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          gradient: LinearGradient(
                              colors: [
                                const Color(0xFF1e5171),
                                const Color(0xFF8DA1FF),
                              ],
                              begin: const FractionalOffset(.2, 0.2),
                              end: const FractionalOffset(.50, 1.0),
                              stops: [0.1, 1.0],
                              tileMode: TileMode.clamp),
                        ),
                      ),
                    )
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
