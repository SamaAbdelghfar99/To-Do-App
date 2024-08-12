import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/features/home_Screen/views/widgets/task_item.dart';

class Tasks extends StatelessWidget {
  const Tasks({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        CalendarTimeline(
          initialDate: DateTime.now(),
          firstDate: DateTime.now().subtract(
            Duration(days: 365),
          ),
          lastDate: DateTime.now().add(
            Duration(days: 365),
          ),
          onDateSelected: (date) => print(date),
          leftMargin: 20,
          monthColor: Colors.black,
          dayColor: Colors.blue,
          activeDayColor: Colors.white,
          activeBackgroundDayColor: Colors.blue,
          selectableDayPredicate: (date) => date.day != 23,
          locale: 'en',
        ),
        SizedBox(
          height: 24,
        ),
        Expanded(
          child: ListView.builder(itemBuilder: (context,index){
            return TaskItem();
          },
            itemCount: 30,
          ),
        )
      ],
    );
  }
}