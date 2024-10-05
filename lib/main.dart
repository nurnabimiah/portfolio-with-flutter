import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/pages/home/home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';


import 'utils/constants.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Portfolio",
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        primaryColor: kPrimaryColor,
        canvasColor: kBackgroundColor,
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      builder: (context, widget) {
        return ResponsiveBreakpoints.builder(

          child: Container(
            color: kBackgroundColor,
            child: widget ?? const SizedBox.shrink(), // Handle the child parameter
          ),
          breakpoints: [
            const Breakpoint(start: 0, end: 450, name: MOBILE),
            const Breakpoint(start: 451, end: 800, name: TABLET),
            const Breakpoint(start: 801, end: 1920, name: DESKTOP),
            const Breakpoint(start: 1921, end: double.infinity, name: '4K'),

          ],
        );
      },
      home: Home(),
    );
  }
}
