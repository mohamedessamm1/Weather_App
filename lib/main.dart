import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/layout/layout_screen/layout_screen.dart';
import 'package:weather/modules/search_screen.dart';
import 'package:weather/network/cache/cache.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await cachehelper.initcache();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return MaterialApp(
            theme: ThemeData(
                appBarTheme: AppBarTheme(
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: Colors.transparent
                    )
                )
            ),
            debugShowCheckedModeBanner: false,
            home: searchscreen()
        );
      },
    );
  }
}


