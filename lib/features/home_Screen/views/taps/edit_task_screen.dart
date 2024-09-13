import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/core/task_model.dart';
import 'package:todoapp/firebase_funcation.dart';

class EditTaskScreen extends StatefulWidget {
  static const String iD='editScreen';

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    var model=ModalRoute.of(context)!.settings.arguments as TaskModel;

    return
      Scaffold(
        appBar: AppBar(
          title: Text('Edit Screen'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Text('Edit Task',style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),),
                  Spacer(),
                  TextFormField(
                    initialValue: model.title,
                    onChanged: (value){
                      model.title=value;
                    },
                    cursorColor: Colors.blue,
                    decoration: InputDecoration(
                      labelText: 'titel',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                  Spacer(),

                  TextFormField(
                    initialValue: model.description,
                    onChanged: (value){
                      model.description=value;
                    },
                    cursorColor: Colors.blue,
                    decoration: InputDecoration(
                      labelText: 'Description',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                  Spacer(),

                  Row(
                    children: [
                      Text('Selected Date',style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),),

                    ],
                  ),
                  Spacer(),

                  InkWell(
                    onTap: ()async{
                      DateTime? newDate =await chooseYourDate();
                      if(newDate!= null){
                        model.date=newDate.millisecondsSinceEpoch;
                        setState(() {

                        });
                      }
                    },
                    child: Text(DateFormat.yMd().format(DateUtils.dateOnly(
                      DateTime.fromMicrosecondsSinceEpoch(model.date??0)
                    )),
                      style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),),
                  ),
                  Spacer(),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.symmetric(vertical: 12,horizontal: 60),
                    ),
                    onPressed: ()async{
                      await FirebaseFunctions.updateTask(model);
                      Navigator.pop(context);
                    }, child:
                  Text('Save changes',style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),),),
                  Spacer(
                    flex: 3,
                  ),

                ],
              ),
            ),
          ),
        ),
      );
  }

  chooseYourDate() async {
    DateTime? chosenDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        Duration(
          days: 365,
        ),
      ),
    );
    if (chosenDate != null) {
      selectedDate = chosenDate;
      setState(() {});
    }
    return chosenDate;
  }
}
