import 'package:bep_desktop/application/screens/goal/goals_screen.dart';
import 'package:bep_desktop/application/screens/home/home_screen.dart';
import 'package:bep_desktop/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomNavigationBar extends StatefulWidget {
  CustomNavigationBar({Key? key}) : super(key: key);

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppTheme.primaryColor,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: BottomNavigationBar(
            elevation: 0,
            backgroundColor: AppTheme.secondaryColor,
            mouseCursor: MouseCursor.defer,
            selectedItemColor: AppTheme.primaryIconColor,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            enableFeedback: true,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.dashboard_customize_outlined,
                    color: AppTheme.primaryIconColor),
                label: 'Dashboard',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.attach_money_outlined,
                    color: AppTheme.primaryIconColor),
                label: 'Goals',
              ),
            ],
            onTap: (int index) {
              setState(() {
                _currentIndex = index;
              });
            },
            currentIndex: _currentIndex,
          ),
        ),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          HomeScreen(),
          GoalsScreen(),
        ],
      ),
    );
  }
}
