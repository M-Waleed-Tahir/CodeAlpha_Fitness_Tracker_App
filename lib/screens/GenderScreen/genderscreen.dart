import 'package:fitness_tracker_app/constants/color.dart';
import 'package:fitness_tracker_app/models/detailpagebutton.dart';
import 'package:fitness_tracker_app/models/detailpagetitle.dart';
import 'package:flutter/material.dart';

class Genderscreen extends StatefulWidget {
  const Genderscreen({super.key});

  @override
  State<Genderscreen> createState() => _GenderscreenState();
}

class _GenderscreenState extends State<Genderscreen> {
  bool isMale = true;
  bool isFemale = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.only(
          top: size.height * 0.06,
          left: size.width * 0.05,
          right: size.width * 0.05,
          bottom: size.height * 0.03,
        ),
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            Detailpagetitle(
                text: 'This will help u to find the best Content for you',
                title: 'Tell us bout yourself',
                color: Colors.white),
            SizedBox(
              height: size.height * 0.055,
            ),
            GenderIcon(
              icon: Icons.male,
              title: ' Male  ',
              ontap: () {
                setState(() {
                  isMale = true;
                  isFemale = false;
                });
              },
              color: Colors.blue,
              isSelected: isMale,
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            GenderIcon(
              icon: Icons.female,
              title: 'Female',
              ontap: () {
                setState(() {
                  isMale = false;
                  isFemale = true;
                });
              },
              color: Colors.pink,
              isSelected: isFemale,
            ),

            Spacer(),

            Detailpagebutton(
              text: 'Next',
              onBackTap: () {
                Navigator.pop(context);
              },
              onTap: () {
                Navigator.pushNamed(context, '/age');
              },
              showBackButton: false,
            ),
          ],
        ),
      ),
    );
  }
}

class GenderIcon extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback ontap;
  final Color? color;
  final bool isSelected;

  const GenderIcon(
      {super.key,
      required this.icon,
      required this.title,
      required this.ontap,
      this.color,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.all(size.width * 0.05),
        decoration: BoxDecoration(
          color: isSelected ? MainColor : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Icon(
                icon,
                size: size.width * 0.1,
                color: color,
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Text(
                title,
                style: TextStyle(
                    color: isSelected ? Colors.black : Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
