import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:conde_mobprog/constant.dart';
import 'package:conde_mobprog/screens/newsfeed_screen.dart';
import 'package:conde_mobprog/screens/notifications_screen.dart';
import 'package:conde_mobprog/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onTappedBar(int value) {
    setState(() => _selectedIndex = value);
    _pageController.jumpToPage(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: fbTextColorWhite,
        elevation: 2,
        title: CustomText(
          text: 'Facebook',
          fontSize: 25.sp,
          color: fbPrimary,
          fontFamily: 'Klavika',
          fontWeight: FontWeight.w700,
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (page) => setState(() => _selectedIndex = page),
        children: const <Widget>[
          NewsfeedScreen(),
          NotificationsScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        showSelectedLabels: false,
        onTap: _onTappedBar,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
        ],
        selectedItemColor: fbPrimary,
        currentIndex: _selectedIndex,
      ),
    );
  }
}