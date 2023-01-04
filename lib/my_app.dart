import 'package:bep_desktop/application/screens/home/home_screen.dart';
import 'package:bep_desktop/application/screens/navigation_bar/custom_navigation_bar.dart';
import 'package:bep_desktop/theme/app_theme.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: AppTheme.primaryColor,
      ),
      home: CustomNavigationBar(),
    );
  }
}
