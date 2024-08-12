import 'package:flutter/material.dart';

class AddTaskBottomSheet extends StatelessWidget {
  const AddTaskBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            child: Text('add new Task',style: TextStyle(
              fontSize: 20,
            ),
            ),
          ),
          SizedBox(
            height: 18,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Title',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
              ),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          TextField(
            cursorColor: Colors.blue,
            decoration: InputDecoration(
              labelText: 'Description',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide(color: Colors.blue,),
              ),
            ),
          ),
          SizedBox(
            height: 18,
          ),
          Text('Select Date',style: TextStyle(
            fontSize: 16,
          ),),
          SizedBox(
            height: 18,
          ),
          Center(child: Text('28/8/2024',style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),)),
          SizedBox(
            height: 18,
          ),
          Container(
            width: double.infinity,
              child: ElevatedButton(onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: Text('Add',style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),)))
        ],
      ),
    );
  }
}
