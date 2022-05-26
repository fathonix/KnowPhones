import 'package:flutter/material.dart';
import 'package:knowphones/constants.dart';
import 'package:knowphones/screens/all_devices.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const TextStyle lightAppBarTextStyle = TextStyle(
      fontWeight: FontWeight.w700,
      fontFamily: Constants.fontFamily,
      fontSize: 20,
      color: Constants.lightForegroundColor,
    );

    final TextStyle darkAppBarTextStyle =
        lightAppBarTextStyle.copyWith(color: Constants.darkForegroundColor);

    const TextTheme lightTextTheme = TextTheme(
      subtitle1: TextStyle(
        color: Colors.black,
        fontFamily: Constants.fontFamily,
      ),
      subtitle2: TextStyle(
        color: Colors.black,
        fontFamily: Constants.fontFamily,
        fontWeight: FontWeight.w700,
        fontSize: 18,
      ),
      bodyText1: TextStyle(
        color: Colors.black,
        fontFamily: Constants.fontFamily,
        fontSize: 18,
      ),
      bodyText2: TextStyle(
        color: Colors.black,
        fontFamily: Constants.fontFamily,
      ),
    );

    final TextTheme darkTextTheme = lightTextTheme.copyWith(
      subtitle1: const TextStyle(
        color: Colors.white,
        fontFamily: Constants.fontFamily,
      ),
      subtitle2: const TextStyle(
        color: Colors.white,
        fontFamily: Constants.fontFamily,
        fontWeight: FontWeight.w700,
        fontSize: 20,
      ),
      bodyText1: const TextStyle(
        color: Colors.white,
        fontFamily: Constants.fontFamily,
        fontSize: 16,
      ),
      bodyText2: const TextStyle(
        color: Colors.white,
        fontFamily: Constants.fontFamily,
      ),
    );

    const AppBarTheme lightAppBar = AppBarTheme(
      backgroundColor: Constants.lightSecondaryColor,
      foregroundColor: Constants.lightForegroundColor,
      iconTheme: IconThemeData(color: Constants.lightForegroundColor),
      titleTextStyle: lightAppBarTextStyle,
    );

    final AppBarTheme darkAppBar = AppBarTheme(
      backgroundColor: Constants.darkSecondaryColor,
      foregroundColor: Constants.darkForegroundColor,
      iconTheme: const IconThemeData(color: Constants.darkForegroundColor),
      titleTextStyle: darkAppBarTextStyle,
    );

    const ListTileThemeData lightListTile = ListTileThemeData(
      selectedTileColor: Colors.transparent,
      selectedColor: Colors.transparent,
      tileColor: Colors.transparent,
      textColor: Colors.black,
    );

    const ListTileThemeData darkListTile = ListTileThemeData(
      selectedTileColor: Colors.transparent,
      selectedColor: Colors.transparent,
      tileColor: Colors.transparent,
      textColor: Colors.white,
    );

    final ThemeData lightTheme = ThemeData(
      fontFamily: Constants.fontFamily,
      primaryColor: Constants.lightForegroundColor,
      scaffoldBackgroundColor: Constants.lightBackgroundColor,
      appBarTheme: lightAppBar,
      textTheme: lightTextTheme,
      listTileTheme: lightListTile,
      cardTheme: const CardTheme(color: Constants.lightSecondaryColor),
    );

    final ThemeData darkTheme = lightTheme.copyWith(
      primaryColor: Constants.darkForegroundColor,
      scaffoldBackgroundColor: Constants.darkBackgroundColor,
      appBarTheme: darkAppBar,
      textTheme: darkTextTheme,
      listTileTheme: darkListTile,
      cardTheme: const CardTheme(color: Constants.darkSecondaryColor),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KnowPhones',
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const AllDevicesScreen(),
    );
  }
}
