import 'package:fitness_tracker_app/models/detailpagebutton.dart';
import 'package:fitness_tracker_app/models/detailpagetitle.dart';
import 'package:fitness_tracker_app/models/listwheelviewscroller.dart';
import 'package:flutter/material.dart';

class Heightscreen extends StatefulWidget {
  const Heightscreen({super.key});

  @override
  State<Heightscreen> createState() => _HeightscreenState();
}

class _HeightscreenState extends State<Heightscreen> {
  @override
  Widget build(BuildContext context) {

    List <String> items = [];
    for(int i = 1 ; i < 200 ; i ++ ){
      items.add(i.toString());
    }
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
                title: "What's your Height?",
                color: Colors.white),



            SizedBox(
              height: size.height * 0.055,
            ),

            SizedBox(height: size.height * 0.5,
            child: Listwheelviewscroller(items: items),
            ),

            Detailpagebutton(
              text: 'Next',
              onTap: () {
                Navigator.pushNamed(context, '/weight');
              },
              onBackTap: () {Navigator.pop(context);},
              showBackButton: true,
            )
          ],
        ),
      ),
    );
  }
}
