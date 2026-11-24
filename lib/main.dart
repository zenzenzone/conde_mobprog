import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:conde_mobprog/constant.dart';
import 'package:conde_mobprog/screens/home_screen.dart';
import 'package:conde_mobprog/screens/newsfeed_screen.dart';
import 'package:conde_mobprog/screens/notifications_screen.dart';
import 'package:flutter/material.dart';

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
          title: 'Facebook Replication',
          theme: ThemeData(
            scaffoldBackgroundColor: const Color(0xFFF0F2F5),
            colorScheme: ColorScheme.fromSeed(seedColor: fbPrimary),
            fontFamily: 'Frutiger',
          ),
          initialRoute: '/home',
          routes: {
            '/home': (context) => const HomeScreen(),
            '/newsfeed': (context) => const Scaffold(body: NewsfeedScreen()),
            '/notifications': (context) =>
                const Scaffold(body: NotificationsScreen()),
          },
        );
      },
    );
  }
}