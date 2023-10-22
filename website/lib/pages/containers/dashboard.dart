import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:website/utils/colors.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      desktop: DesktopDashboard(),
      mobile: MobileDashboard()
    );
  }

  Widget DesktopDashboard(){
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: AppColors.primary),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 0, top: 20),
            child: Container(
              height: 195,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('website/assets/images/mountainlake.jpeg'), fit: BoxFit.contain)),
            ),
          ),
        ],
      )
    );
  }

  Widget MobileDashboard(){ //hamburger menu does not work...
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: AppColors.primary),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 0, top: 20),
            child: Container(
              height: 195,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('website/assets/images/mountainlake.jpeg'), fit: BoxFit.contain)),
            ),
          ),
        ],
      )
    );
  }
}