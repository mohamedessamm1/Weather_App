import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/modules/search_screen.dart';
import 'package:weather/shared/component/component.dart';
import 'package:weather/shared/model.dart';
import 'package:hexcolor/hexcolor.dart';

class layout_screen extends StatefulWidget {
  @override
  State<layout_screen> createState() => _layout_screenState();
}

class _layout_screenState extends State<layout_screen> {
  weathermodel? model;
  Color main = const Color(0xFF8DA4FF);
  var dt = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    const Color(0xFF3366DF),
                    const Color(0xFF8DA1FF),
                  ],
                  begin: const FractionalOffset(.40, 1),
                  end: const FractionalOffset(0.0, 0),
                  stops: [0.1, 1.0],
                  tileMode: TileMode.clamp),
            ),
          )),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  const Color(0xFF3366DF),
                  const Color(0xFF8DA1FF),
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 1.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              Center(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          ' ${weatherdata!.name.toString()}',
                          style: TextStyle(
                              fontSize: 30.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.location_on,
                          color: Colors.red.shade900,
                          size: 40,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                  ],
                ),
              ),
              Container(
                height: 150.h,
                width: 180.w,
                child: Stack(
                  children: [
                    Image.asset('images/align.png'),
                  ],
                ),
              ),
              Center(
                child: Column(
                  children: [
                    Text(
                      ' ${weatherdata!.nowtemp_c}°',
                      style: TextStyle(
                          fontSize: 50.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${weatherdata!.text}',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 14.h,
              ),
              Container(
                decoration: BoxDecoration(
                    color: main,
                    borderRadius: BorderRadius.all(Radius.circular(90.r))),
                width: 300.w,
                height: 70.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.wb_cloudy_outlined,
                          color: Colors.white,
                          size: 30.w,
                        ),
                        Text(
                          'cloud',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          ' ${weatherdata!.cloud}',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    RotatedBox(
                      quarterTurns: 1,
                      child: divider(),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.wind_power_outlined,
                          color: Colors.white,
                          size: 30.w,
                        ),
                        Text(
                          'wind',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          ' ${weatherdata!.wind_mph}',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    RotatedBox(
                      quarterTurns: 1,
                      child: divider(),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.outbond_outlined,
                          color: Colors.white,
                          size: 30.w,
                        ),
                        Text(
                          'pressure',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          ' ${weatherdata!.pressure_in}',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                height: 350.h,
                width: 300.w,
                decoration: BoxDecoration(
                    color: main,
                    borderRadius: BorderRadius.all(Radius.circular(20.r))),
                child: Padding(
                  padding: EdgeInsets.all(15.0.w),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            ' ${dt.day}/${dt.month}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                            ),
                          ),
                          Spacer(),
                          Image.network(
                            'http:${weatherdata?.firstdateicon}',
                          ),
                          Spacer(),
                          Text(
                            '${weatherdata?.firsttemp_c}°',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            ' ${dt.day + 1}/${dt.month}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                            ),
                          ),
                          Spacer(),
                          Image.network(
                            'http:${weatherdata?.secondicon}',
                          ),
                          Spacer(),
                          Text(
                            '${weatherdata?.secondtemp_c}°',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            ' ${dt.day + 2}/${dt.month}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                            ),
                          ),
                          Spacer(),
                          Image.network(
                            'http:${weatherdata?.thirdicon}',
                          ),
                          Spacer(),
                          Text(
                            '${weatherdata?.thirdtemp_c}°',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            ' ${dt.day + 3}/${dt.month}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                            ),
                          ),
                          Spacer(),
                          Image.network(
                            'http:${weatherdata?.fouricon}',
                          ),
                          Spacer(),
                          Text(
                            '${weatherdata?.fourthtemp_c}°',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            ' ${dt.day + 4}/${dt.month}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                            ),
                          ),
                          Spacer(),
                          Image.network(
                            'http:${weatherdata?.fiveicon}',
                          ),
                          Spacer(),
                          Text(
                            '${weatherdata?.fivetemp_c}°',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            ' ${dt.day + 5}/${dt.month}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                            ),
                          ),
                          Spacer(),
                          Image.network(
                            'http:${weatherdata?.sixicon}',
                          ),
                          Spacer(),
                          Text(
                            '${weatherdata?.sixtemp_c}°',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )

              // InkWell(
              //   onTap: (){
              //     Navigator.pop(context);
              //   },
              //   child: Container(
              //     child: Center(child: Text('search  again',style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold))),
              //     height: 65,
              //     width: 300,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(20),
              //       gradient: LinearGradient(
              //           colors: [
              //             const Color(0xFF00CCFF),
              //             const Color(0xFF3366FF),
              //           ],
              //           begin: const FractionalOffset(0.0, 0.0),
              //           end: const FractionalOffset(1.0, 0.0),
              //           stops: [0.0, 1.0],
              //           tileMode: TileMode.clamp),
              //     )
              //
              //     ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
