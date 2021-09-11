import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:q_tech/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(360, 690),
        builder: () => MaterialApp(
            debugShowCheckedModeBanner: false,
            // locale: DevicePreview.locale(context),
            title: 'African World Street',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: WelcomeScreen(),
        )
    );
  }
}


