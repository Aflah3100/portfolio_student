import 'package:flutter/material.dart';
import 'package:portfolio_student/provider/screens_provider.dart';
import 'package:portfolio_student/screens/home_screen/home_screen.dart';
import 'package:portfolio_student/screens/input_screen/input_screen.dart';
import 'package:portfolio_student/screens/main_screen/widgets/bottom_nav_bar.dart';
import 'package:portfolio_student/screens/profile_screen/profile_screen.dart';
import 'package:portfolio_student/screens/student_portfolio_screen/portfolio_screen.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Screens-list
    final List<Widget> appScreens = [
      const HomeScreen(),
       PortfolioScreen(),
      const InputScreen(),
      const ProfileScreen()
    ];

    return Consumer<ScreensProvider>(builder: (context, notifier, _) {
      return Scaffold(
          backgroundColor: Colors.white,
          body: appScreens[notifier.getScreenIndex()],
          bottomNavigationBar: const BottomNavBar());
    });
  }
}
