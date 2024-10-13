import 'package:fitness_tracker_app/screens/homeScreen/bottomNavigationbar.dart';
import 'package:flutter/material.dart';
import '../../models/detailpagebutton.dart';
import '../../models/detailpagetitle.dart';
import '../../models/listwheelviewscroller.dart';

class Activityscreen extends StatelessWidget {
  const Activityscreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> items = [
      'Rookie',
      'Beginner',
      'Intermediate',
      'Advance',
      'Pro',
    ];
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: size.width,
        height: size.height,
        padding: EdgeInsets.only(
          top: size.height * 0.06,
          left: size.width * 0.05,
          right: size.width * 0.05,
          bottom: size.height * 0.03,
        ),
        child: Column(
          children: [
            Detailpagetitle(
                text: 'This will help us to create personalized plan for you',
                title: "What's your physical activity level?",
                color: Colors.white),
            SizedBox(
              height: size.height * 0.044,
            ),
            SizedBox(
              height: size.height * 0.5,
              child: Listwheelviewscroller(items: items),
            ),
            Detailpagebutton(
              text: 'Start',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomepageNavbar(),
                    ));
              },
              onBackTap: () {
                Navigator.pop(context);
              },
              showBackButton: true,
            )
          ],
        ),
      ),
    );
  }
}
