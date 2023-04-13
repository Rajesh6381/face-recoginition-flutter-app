import 'dart:convert';

import 'package:attendance_app/modals/modals.dart';
import 'package:attendance_app/widgets/class_selector_widget.dart';
import 'package:attendance_app/widgets/date_picker.dart';
import 'package:attendance_app/widgets/student_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:intl/intl.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

import '../widgets/error_snackbar.dart';


class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({Key? key}) : super(key: key);

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {

  Query dbRef = FirebaseDatabase.instance.ref().child('/');
  late Map student;
  String date = DateFormat('dd-MM-yyyy').format(DateTime.now()).toString();
  String classAndSection = '';


  void dateOnChange(DateTime date) {
    setState(() {
      this.date = DateFormat('dd-MM-yyyy').format(date).toString();
    });
  }

  void classOnChange(String val) {
    setState(() {
      classAndSection = val;
    });
  }

  final List<Map<String, dynamic>> items = [
    {
      'value': 'IT',
      'label': 'IT ',
    },
    {
      'value': 'CSE-A',
      'label': 'CSE - A',
    },
    {
      'value': 'CSE-B',
      'label': 'CSE - B',
    },
  ];

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Text("Attendance System"),
      ),
      body: OfflineBuilder(
        connectivityBuilder: (
            BuildContext context,
            ConnectivityResult connectivity,
            Widget child,
            ) {
          final bool connected = connectivity != ConnectivityResult.none;


          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                DatePickers(onchanged:dateOnChange ,date: date,), // To Select Date
                classSelector(
                  items: items,
                  classOnChange: classOnChange,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text('Attendance List',style: TextStyle(fontSize: 16,color: Colors.black87),),
                const Divider(
                  color: Colors.white,
                  thickness: 2,
                ),
                classAndSection != ''?Expanded(
                  child:connected? FirebaseAnimatedList(query: dbRef, itemBuilder: (BuildContext context,DataSnapshot snap,Animation<double> animation , int index){
                    student =  snap.value as Map;
                    print(jsonEncode(student));
                    AttendanceModals attendanceModals = AttendanceModals.fromJson(json.decode(jsonEncode(student)));
                    // print(attendanceModals.registerNumber);
                    student['key'] = snap.key;

                    return StdentCard(data: attendanceModals,date: date,classAndSection: classAndSection,);
                  }):Container(
                    child: Center(
                      child: Text("There has been error ! \n please try again later",style: TextStyle(color: Colors.red,fontStyle: FontStyle.italic,fontSize: 16),),
                    ),
                  ),
                ):Expanded(
                  child: Center(
                    child: Text('Please select class  !',style: TextStyle(fontSize: 16,fontStyle: FontStyle.italic),),
                  ),
                ),



              ],
            ),
          );

        },

        child:Text('hwllo'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: const Icon(Icons.add),
      ),
    );
  }
}
