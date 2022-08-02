import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFFFAFAFA),
    fontFamily: 'Gilroy',
    colorScheme: const ColorScheme.light(),
    primarySwatch: Colors.red,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.red[900],
      centerTitle: true,
      elevation: 0,
      titleTextStyle: const TextStyle(
        fontSize: 20,
        fontFamily: 'Gilroy',
      ),
    ),
  );

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFF37474F),
    fontFamily: 'Gilroy',
    colorScheme: const ColorScheme.dark(),
    primarySwatch: Colors.amber,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF263238),
      centerTitle: true,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontFamily: 'Gilroy',
      ),
    ),
  );
}

extension ColorSchemeS on ColorScheme {
  Color get mainTextColor => brightness == Brightness.light
      ? const Color(0xFF192226)
      : const Color(0xFFD7D7D7);

  Color get dropDownBackgroundColor => brightness == Brightness.light
      ? const Color(0xFFFFEBEE)
      : const Color(0xFF263238);

  Color get dropDownItemBackgroundColor => brightness == Brightness.light
      ? const Color(0xFFFFCDD2)
      : const Color(0xFFFFC107);

  Color get labelTextColor => brightness == Brightness.light
      ? const Color(0xFFB71C1C)
      : const Color(0xFFFFC107);

  Color get pasteButtonColor => brightness == Brightness.light
      ? const Color(0xFF9E9E9E)
      : const Color(0xFFFFFFFF);

  Color get changeButtonColor => brightness == Brightness.light
      ? const Color(0xFF009688)
      : const Color(0xFF80CBC4);

  Color get clearButtonColor => brightness == Brightness.light
      ? const Color(0xFFB71C1C)
      : const Color(0xFFEF9A9A);

  Color get switchDescriptionColor => brightness == Brightness.light
      ? const Color(0xFFB71C1C)
      : const Color(0xFFFFC107);
}
