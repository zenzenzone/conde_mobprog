import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:conde_mobprog/constants.dart';
import 'package:conde_mobprog/screens/home_screen.dart';
import 'package:conde_mobprog/screens/newsfeed_screen.dart';
import 'package:conde_mobprog/screens/notification_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 715),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: appName,
          theme: ThemeData(
            scaffoldBackgroundColor: fbTextColorWhite,
            colorScheme: ColorScheme.fromSeed(seedColor: fbPrimary),
            fontFamily: 'Frutiger',
          ),
          initialRoute: '/home',
          routes: {
            '/home': (context) => const HomeScreen(),
            '/newsfeed': (context) => const Scaffold(body: NewsfeedScreen()),
            '/notification': (context) =>
                const Scaffold(body: NotificationScreen()),
          },
        );
      },
    );
  }
}