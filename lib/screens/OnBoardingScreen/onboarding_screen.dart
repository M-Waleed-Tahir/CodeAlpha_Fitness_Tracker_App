import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController controller = PageController();
  bool isLastPage = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          /// 1.Three Pages View with Text
          PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                isLastPage = index == 2;
              });
            },
            children: [
              _buildPageIndicator(
                  imageAsset: 'assets/onboardingImages/img_background_1.png',
                  text: 'MEET YOUR COACH,\nSTART YOUR JOURNEY'),
              _buildPageIndicator(
                  imageAsset: 'assets/onboardingImages/img_background_2.png',
                  text: 'CREATE A WORKOUT PLAN\nTO STAY FIT'),
              _buildPageIndicator(
                  imageAsset: 'assets/onboardingImages/img_background_3.png',
                  text: 'ACTION IS THE\nKEY TO ALL SUCCESS'),
            ],
          ),

          SizedBox(
            height: 10,
          ),

          /// 2.Skip Button

          isLastPage
              ? SizedBox.shrink()
              : Positioned(
                  top: size.height * 0.05,
                  right: size.width * 0.05,
                  child: TextButton(
                      onPressed: () {
                        controller.animateToPage(2,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.ease);
                      },
                      child: Text(
                        'Skip',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ))),

          /// 3.Start Now Button

          isLastPage
              ? Positioned(
                  left: size.width * 0.25,
                  right: size.width * 0.25,
                  bottom: size.height * 0.09,
                  child: Container(
                    width: size.width * 0.5,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(208, 253, 62, 1),
                        borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/gender');
                            },
                            child: Text(
                              '     Start Now',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          width: 0,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                )
              : SizedBox.shrink(),

          /// 4.Dots Effect

          Positioned(
              bottom: size.height * 0.04,
              left: size.width * 0.42,
              child: SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: ExpandingDotsEffect(
                    dotHeight: 10,
                    dotWidth: 10,
                    dotColor: Colors.grey,
                    activeDotColor: Color.fromRGBO(208, 253, 62, 1)),
              )),
        ],
      ),
    );
  }

  /// 5.Build Widget to Manage to Manage Above Things !!!

  Widget _buildPageIndicator(
      {required String text, required String imageAsset}) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Image.asset(
          imageAsset,
          height: size.height * 0.6,
          width: size.width,
          fit: BoxFit.cover,
        ),
        Positioned(
          bottom: 0,
          child: Container(
            height: size.height * 0.4,
            width: size.width,
            child: Center(
                child: Text(
              text,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            )),
          ),
        )
      ],
    );
  }
}
