import 'package:flutter/material.dart';
import 'package:flutter_week_view/flutter_week_view.dart';
import 'package:get/get.dart';

class MySchedule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateTime date = DateTime(now.year, now.month, now.day);
    return DayView(
      userZoomable: true,
      dayBarStyle: DayBarStyle(
          dateFormatter: (year, month, day) => "$day/$month/$year",
          textStyle: Get.textTheme.bodyText1,
          textAlignment: Alignment.center),
      minimumTime: HourMinute.fromDuration(duration: Duration(hours: 11)),
      maximumTime: HourMinute.fromDuration(duration: Duration(hours: 22)),
      date: now,
      events: [
        // FlutterWeekViewEvent(
        //   title: 'An event 1',
        //   description: 'A description 1',
        //   start: date.subtract(Duration(hours: 1)),
        //   end: date.add(Duration(hours: 18, minutes: 30)),
        // ),
        FlutterWeekViewEvent(
          title: 'Jimmy Eat World',
          description: 'Stage 2',
          start: now,
          end: date.add(Duration(hours: 14)),
        ),
        FlutterWeekViewEvent(
          title: 'Greenday',
          description: 'Stage 1',
          start: date.add(Duration(hours: 12, minutes: 30)),
          end: date.add(Duration(hours: 14, minutes: 30)),
        ),
        FlutterWeekViewEvent(
          title: 'Blink 182',
          description: 'Stage 1',
          start: date.add(Duration(hours: 15)),
          end: date.add(Duration(hours: 16)),
        ),
        FlutterWeekViewEvent(
          title: 'New Found Glory',
          description: 'Stage 1',
          start: date.add(Duration(hours: 17)),
          end: date.add(Duration(hours: 19)),
        ),
        FlutterWeekViewEvent(
          title: 'Peur',
          description: 'Stage 1',
          start: date.add(Duration(hours: 20)),
          end: date.add(Duration(hours: 22)),
        ),
      ],
      style: DayViewStyle.fromDate(
        date: now,
        currentTimeCircleColor: Colors.pink,
      ),
    );
  }
}
