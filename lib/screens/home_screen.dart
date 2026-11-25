import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:conde_mobprog/constants.dart';
import 'package:conde_mobprog/screens/newsfeed_screen.dart';
import 'package:conde_mobprog/screens/notification_screen.dart';
import 'package:conde_mobprog/widgets/custom_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  // Enhancement 2: one title per page, picked by the selected tab
  final List<String> _titles = [appName, 'Notifications', 'Profile'];

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
          text: _titles[_selectedIndex],
          fontSize: 25.sp,
          color: _selectedIndex == 0 ? fbPrimary : fbDarkPrimary,
          fontFamily: 'Klavika',
          fontWeight: FontWeight.w700,
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (page) => setState(() => _selectedIndex = page),
        children: [
          const NewsfeedScreen(),
          const NotificationScreen(),
          Center(
            child: CustomText(
              text: 'Profile',
              fontSize: 20.sp,
              color: fbDarkPrimary,
            ),
          ),
        ],
      ),
      // Enhancement 3: a third BottomNavigationBarItem
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        onTap: _onTappedBar,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        selectedItemColor: fbPrimary,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
      ),
    );
  }
}