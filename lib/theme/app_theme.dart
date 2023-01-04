import 'package:flutter/material.dart';

class AppTheme {
  static final Color primaryColor = Color(0xFF026342);
  static final Color secondaryColor = Color(0xFF1B7456);

  static final Color primaryTextColor = Color(0xFF3C4046);
  static final Color secondaryTextColor = Color(0xFFF4F7F7);

  static final Color primaryBackgroundColor = Color(0xFFefefef);

  static final Color primaryIconColor = Color(0xFFFFFFFF);

  static final TextStyle titleTextStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: primaryTextColor,
  );

  static final TextStyle subtitleTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: primaryTextColor,
  );

  static final TextStyle bodyTextStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: primaryTextColor,
  );

  static final TextStyle captionTextStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: primaryTextColor,
  );

  static const TextStyle buttonTextStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
}
