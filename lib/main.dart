import 'package:auto_world/config/theme.dart';
import 'package:auto_world/screens/home.dart';
import 'package:auto_world/screens/login.dart';
import 'package:auto_world/screens/register.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/home",
      routes: {
        "/login": (_) => Login(),
        "/register": (_) => Register(),
        "/home": (_) => Home()
      },
      theme: ThemeData(
        fontFamily: "Sansation",
        appBarTheme: AppBarTheme(
          elevation: 0.0,
          color: secondary,

        ),
        primarySwatch: primarySwatch,
        primaryColor: primary,
        accentColor: primary,
        buttonColor: primary,
        scaffoldBackgroundColor: secondary,
        buttonTheme: ButtonThemeData(
          buttonColor: secondary
        ),
        primaryIconTheme: IconThemeData(color: Colors.white),
        primaryTextTheme: TextTheme(
          title: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
