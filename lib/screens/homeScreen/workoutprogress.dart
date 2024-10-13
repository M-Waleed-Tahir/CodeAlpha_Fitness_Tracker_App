import 'package:calendar_slider/calendar_slider.dart';
import 'package:fitness_tracker_app/constants/color.dart';
import 'package:flutter/material.dart';

class workoutProgress extends StatefulWidget {
  workoutProgress({super.key});

  @override
  State<workoutProgress> createState() => _workoutProgressState();
}

class _workoutProgressState extends State<workoutProgress> {
  final _firstController = CalendarSliderController();

  // ignore: unused_field
  late DateTime _selectedDateAppBBar;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CalendarSlider(
        controller: _firstController,
        selectedDayPosition: SelectedDayPosition.center,
        fullCalendarScroll: FullCalendarScroll.vertical,
        backgroundColor: Colors.grey[900],
        fullCalendarWeekDay: WeekDay.short,
        selectedTileBackgroundColor: MainColor,
        monthYearButtonBackgroundColor: Colors.grey[700],
        monthYearTextColor: Colors.white,
        tileBackgroundColor: Colors.grey[700],
        selectedDateColor: Colors.black,
        dateColor: Colors.white,
        tileShadow: BoxShadow(
          color: Colors.black.withOpacity(1),
        ),
        locale: 'en',
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(Duration(days: 100)),
        lastDate: DateTime.now().add(Duration(days: 100)),
        onDateSelected: (date) {
          setState(() {
            _selectedDateAppBBar = date;
          });
        },
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.05,
              ),
              CircularIndicatorText(
                text: '652 Cal',
                subText: 'Active Calories',
                color: Color.fromRGBO(208, 253, 62, 1),
                strokeWidth: 10,
                size: size.width * 0.45,
                value: 0.65,
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircularIndicatorText(
                    text: '6540',
                    subText: 'Steps',
                    color: Colors.red,
                    strokeWidth: 7,
                    size: size.width * 0.26,
                    value: 0.8,
                  ),
                  CircularIndicatorText(
                    text: '45min',
                    subText: 'Time',
                    color: Colors.blue,
                    strokeWidth: 7,
                    size: size.width * 0.26,
                    value: 0.45,
                  ),
                  CircularIndicatorText(
                    text: '72bpm',
                    subText: 'Heart',
                    color: Colors.orange,
                    strokeWidth: 7,
                    size: size.width * 0.26,
                    value: 0.62,
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Workout Progress',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    Text("View All",
                        style: TextStyle(fontSize: 15, color: MainColor)),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              TextCheckboxContainer(
                text: 'Stability Training',
                subtext: '10:00am - 11:00am',
                value: true,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              TextCheckboxContainer(
                text: 'Stability Training',
                subtext: '10:00am - 11:00am',
                value: false,
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              TextCheckboxContainer(
                text: 'Stability Training',
                subtext: '10:00am - 11:00am',
                value: true,
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              TextCheckboxContainer(
                text: 'Stability Training',
                subtext: '10:00am - 11:00am',
                value: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextCheckboxContainer extends StatelessWidget {
  TextCheckboxContainer(
      {super.key,
      required this.text,
      required this.subtext,
      required this.value});

  final String text;
  final String subtext;
  final bool value;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.085,
      width: size.width * 0.9,
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 13),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    subtext,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  )
                ]),
          ),
          Container(
            child: Center(
              child: Checkbox(
                onChanged: (value) {},
                value: value,
                activeColor: MainColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CircularIndicatorText extends StatelessWidget {
  CircularIndicatorText({
    super.key,
    required this.text,
    required this.subText,
    required this.color,
    required this.strokeWidth,
    this.size,
    required this.value,
  });
  final String text;
  final double? size;
  final String subText;
  final Color color;
  final double strokeWidth;
  final double value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: size,
            width: size,
            child: CircularProgressIndicator(
              value: value,
              backgroundColor: Colors.grey[800],
              valueColor: AlwaysStoppedAnimation<Color>(color),
              strokeWidth: strokeWidth,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(fontSize: 26, color: Colors.white),
              ),
              Text(
                subText,
                style: TextStyle(fontSize: 15, color: Colors.white),
              )
            ],
          )
        ],
      ),
    );
  }
}
