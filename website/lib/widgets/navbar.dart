import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:website/pages/home.dart';
import 'package:website/pages/weather.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: MobileNavBar(),
      desktop: DesktopNavBar(),
    );
  }
  
Future<void> _launchUrl() async {
  const url = 'https://www.recreation.gov/';
  if (await canLaunch(url)) { // Changed 'canLaunchUrl' to 'canLaunch'
    await launch(url); // Changed 'launchUrl' to 'launch'
  } else {
    throw Exception('Could not launch $url');
  }
}

  Widget MobileNavBar(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.menu),
            navLogo()
          ],
      ),
    );
  }

Widget DesktopNavBar(){
  return Container(
    margin: EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 10
    ),
    height: 70,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        navButton('Home', () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
        }),
        navButton('Weather', () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Weather()));
        }),
         navButton('Equipment', () {
          //Navigator.push(context, MaterialPageRoute(builder: (context) => Equipment()));
        }),
         navButton('Forum', () {
          //Navigator.push(context, MaterialPageRoute(builder: (context) => Forum()));
        }),
        Container(
          height: 45,
          child: ElevatedButton(
            onPressed: _launchUrl,
            child: const Text('Recreation.gov'),
          )
        ),
      ],
    ),
  );
}

  Widget navButton(String text, VoidCallback onPressed){
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 10
        ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18
          ),
        )
      )
    );
  }

  Widget navLogo(){
    return Container(
    width: 110,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/MBClogo.png')
        )
      )
    );
  }
}