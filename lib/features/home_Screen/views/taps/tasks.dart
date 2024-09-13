import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/features/home_Screen/views/widgets/task_item.dart';
import 'package:todoapp/firebase_funcation.dart';

class Tasks extends StatefulWidget {
   Tasks({super.key});

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  DateTime dateTime=DateTime.now();

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        CalendarTimeline(
          initialDate: dateTime,
          firstDate: DateTime.now().subtract(
            Duration(days: 365),
          ),
          lastDate: DateTime.now().add(
            Duration(days: 365),
          ),
          onDateSelected: (date) {
            dateTime=date;
            setState(() {

            });
          },
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
          child: StreamBuilder(
            stream: FirebaseFunctions.getTasks(dateTime),
            builder: (context, snapshot) {
              if(snapshot.connectionState==ConnectionState.waiting){
                return Center(child: CircularProgressIndicator());
              }
              if(snapshot.hasError){
                return Column(
                  children: [
                    Text('Something went wrong'),
                    ElevatedButton(onPressed: (){

                    },
                        child: Text('Try again'))
                  ],
                );
              }
              var tasks=snapshot.data?.docs.map((doc) => doc.data()).toList();
              if(tasks?.isEmpty??true){
                return Text('No Tasks');
              }
              return  ListView.builder(itemBuilder: (context,index){
                return TaskItem(model: tasks[index],);
              },
                itemCount: tasks!.length,
              );
            },

          ),
        )
      ],
    );
  }
}
