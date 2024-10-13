import 'package:fitness_tracker_app/constants/color.dart';
import 'package:fitness_tracker_app/models/detailpagebutton.dart';
import 'package:fitness_tracker_app/models/detailpagetitle.dart';
import 'package:flutter/material.dart';

class Weightscreen extends StatefulWidget {
  const Weightscreen({super.key});

  @override
  State<Weightscreen> createState() => _WeightscreenState();
}

class _WeightscreenState extends State<Weightscreen> {
  double weight = 60.0;
  @override
  Widget build(BuildContext context) {
    List<String> levels = [];

    for (var i = 5; i <= 500; i++) {
      levels.add(i.isEven? "|" : "I");
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
                text: 'You can change this later in the settings',
                title: "What's your weight?",
                color: Colors.white),
            SizedBox(
              height: size.height * 0.055,
            ),
            Text(
              '$weight kg',
              style: TextStyle(
                  color: MainColor,
                  fontSize: size.height * 0.04,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height * 0.055,
            ),
            SizedBox(
              height: size.height * 0.4,
              child: RotatedBox(
                quarterTurns: -1,
                child: ListWheelScrollView(
                  itemExtent: size.height * 0.036,
                  magnification: 1.2,
                  useMagnifier: true,
                  overAndUnderCenterOpacity: 0.3,
                  physics: FixedExtentScrollPhysics(),
                  controller: FixedExtentScrollController(initialItem: (weight * 2).round() -1),
                  onSelectedItemChanged: (index){
                  setState(() {
                    weight = (index + 1) / 2;
                  });
                  },
                  children: levels.map((level) {
                    return RotatedBox(
                      quarterTurns: 1,
                      child: Text(
                        level,
                        style: TextStyle(
                            color: MainColor,
                            fontSize: size.height * 0.03,
                            fontWeight: FontWeight.bold),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            Spacer(),
            Detailpagebutton(
              text: 'Next',
              onTap: () {
                // userProvider.setWeight(weight);
                Navigator.pushNamed(context, '/goal');
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
