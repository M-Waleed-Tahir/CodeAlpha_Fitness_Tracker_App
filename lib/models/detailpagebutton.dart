import 'package:flutter/material.dart';

import '../constants/color.dart';

class Detailpagebutton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool showBackButton;
  final VoidCallback? onBackTap;

  const Detailpagebutton(
      {super.key,
      required this.text,
      required this.onTap,
      this.showBackButton = false,
      required this.onBackTap});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Row(
      children: [
        if (showBackButton)
          GestureDetector(
            onTap: onBackTap,
            child: Container(
              margin: EdgeInsets.only(top: size.height * 0.02),
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              height: size.height * 0.07,
              child: Center(
                child: Text(
                  'Back',
                  style:
                      TextStyle(color: MainColor, fontSize: size.width * 0.05),
                ),
              ),
            ),
          ),
        Spacer(),
        GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
                color: MainColor, borderRadius: BorderRadius.circular(30)),
            margin: EdgeInsets.only(top: size.height * 0.02),
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            height: size.height * 0.07,
            child: Center(
              child: Text(
                text,
                style:
                    TextStyle(color: Colors.black, fontSize: size.width * 0.05),
              ),
            ),
          ),
        )
      ],
    );
  }
}
