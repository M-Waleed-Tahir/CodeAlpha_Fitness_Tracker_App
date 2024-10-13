import 'package:fitness_tracker_app/Provider/user_provider.dart';
import 'package:fitness_tracker_app/models/detailpagebutton.dart';
import 'package:fitness_tracker_app/models/detailpagetitle.dart';
import 'package:fitness_tracker_app/models/listwheelviewscroller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Agescreen extends StatelessWidget {
  const Agescreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> items = [];
    for (int i = 1; i < 100; i++) {
      items.add(i.toString());
    }
    var size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Colors.black,
        body: ChangeNotifierProvider<UserProvider>(
            create: (context) => UserProvider(),
            child: Consumer<UserProvider>(
              builder: (context, userProvider, _) {
                return Container(
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
                          text: 'This help us to create your personalized plan',
                          color: Colors.white,
                          title: 'How old are you ?',
                        ),
                        SizedBox(
                          height: size.height * 0.055,
                        ),
                        SizedBox(
                            height: size.height * 0.5,
                            child: Listwheelviewscroller(items: items)),
                        Detailpagebutton(
                          text: 'Next',
                          onTap: () {
                            userProvider
                                .setAge(int.parse(items[userProvider.age]));
                            Navigator.pushNamed(context, '/height');
                          },
                          onBackTap: () {
                            Navigator.pop(context);
                          },
                          showBackButton: true,
                        )
                      ],
                    ));
              },
            )));
  }
}









// Container(
//             padding: EdgeInsets.only(
//               top: size.height * 0.06,
//               left: size.width * 0.05,
//               right: size.width * 0.05,
//               bottom: size.height * 0.03,
//             ),
//             width: size.width,
//             height: size.height,
//             child: Column(
//               children: [
//                 Detailpagetitle(
//                   text: 'This help us to create your personalized plan',
//                   color: Colors.white,
//                   title: 'How old are you ?',
//                 ),
//                 SizedBox(
//                   height: size.height * 0.055,
//                 ),
//                 SizedBox(
//                     height: size.height * 0.5,
//                     child: Listwheelviewscroller(items: items)),
//                 Detailpagebutton(
//                   text: 'Next',
//                   onTap: () {
//                     Navigator.pushNamed(context, '/height');
//                   },
//                   onBackTap: () {
//                     Navigator.pop(context);
//                   },
//                   showBackButton: true,
//                 )
//               ],
//             )
//             ),