import 'package:flutter/material.dart';
import '../../models/detailpagebutton.dart';
import '../../models/detailpagetitle.dart';
import '../../models/listwheelviewscroller.dart';

class Goalscreen extends StatelessWidget {
  const Goalscreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> items = [
      'Lose Weight',
      'Gain Weight',
      'Stay Fit',
      'Build Muscle',
      'Improve Indurance',
      'Stay Healthy'
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
                title: "What's your Goal?",
                color: Colors.white),
            SizedBox(
              height: size.height * 0.055,
            ),
            SizedBox(
              height: size.height * 0.5,
              child: Listwheelviewscroller(items: items),
            ),
            Detailpagebutton(
              text: 'Next',
              onTap: () {
                Navigator.pushNamed(context, '/activity');
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
