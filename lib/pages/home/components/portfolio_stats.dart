import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/models/stat.dart';
import 'package:flutter_web_portfolio/utils/constants.dart';
import 'package:flutter_web_portfolio/utils/screen_helper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';


final List<Stat> stats = [
  Stat(count: "43", text: "Clients"),
  Stat(count: "68+", text: "Projects"),
  Stat(count: "17", text: "Awards"),
  Stat(count: "10", text: "Years\nExperience"),
];

class PortfolioStats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth, context),
        tablet: _buildUi(kTabletMaxWidth, context),
        mobile: _buildUi(getMobileMaxWidth(context), context),
      ),
    );
  }


  Widget _buildUi(double width, BuildContext context) {
    return Container(
      child: ResponsiveRowColumn(
        layout: ResponsiveRowColumnType.ROW, // Set default layout to Row
        rowMainAxisAlignment: MainAxisAlignment.center,
        columnMainAxisAlignment: MainAxisAlignment.center,
        children: stats.map((stat) {
          return ResponsiveRowColumnItem(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              width: ScreenHelper.isMobile(context)
                  ? width / 2.0 - 20 // Adjust width for mobile
                  : width / 4.0 - 20, // Adjust width for larger screens
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    stat.count,
                    style: GoogleFonts.oswald(
                      fontWeight: FontWeight.w700,
                      fontSize: 32.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    stat.text,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: kCaptionColor,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
