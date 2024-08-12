import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todoapp/features/home_Screen/views/taps/settings.dart';
import 'package:todoapp/features/home_Screen/views/taps/tasks.dart';
import 'package:todoapp/features/home_Screen/views/widgets/add_task_bottom_sheet.dart';
import 'package:todoapp/features/home_Screen/views/widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
   HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'ToDo',
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(context: context,
            isScrollControlled: true,
            builder: (context){
            return Padding(
              padding:  EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: AddTaskBottomSheet(),
            );
          },);
        },
        backgroundColor: Colors.blue,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35),
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 35,
        ),
      ),
      body: taps[selectedIndex],
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        notchMargin: 8,
        shape: CircularNotchedRectangle(),
        padding: EdgeInsets.zero,
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            iconSize: 30,
            onTap: (index){
            selectedIndex=index;
            setState(() {

            });
            },
            currentIndex: selectedIndex,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.list), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
            ]),
      ),
    );
  }
  List<Widget>taps=[Tasks(),Settings()];
}
