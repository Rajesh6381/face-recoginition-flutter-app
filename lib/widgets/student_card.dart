import 'package:attendance_app/modals/attendance_modals.dart';
import 'package:flutter/material.dart';

import '../modals/modals.dart';

class StdentCard extends StatefulWidget {
  const StdentCard({Key? key, required this.data, required this.date, required this.classAndSection}) : super(key: key);
  final AttendanceModals data;

  /// datepicker  date
  final String date;

  /// selector class and section
  final String classAndSection;

  @override
  State<StdentCard> createState() => _StdentCardState();
}

class _StdentCardState extends State<StdentCard> {
  @override
  Widget build(BuildContext context) {


    /// To check the  date is available in student attendanceStatus
    String checkingDate = '';

    widget.data.attendance.forEach((element) {
      if(element.date == widget.date){
        setState(() {
          checkingDate = widget.date;
          //print('true');
        });
      }
    });

    // print(widget.date);
    // print(checkingDate);

    ///sample photo url
    String url ='https://media.istockphoto.com/id/1193994027/photo/cute-boy-outdoors.jpg?s=612x612&w=0&k=20&c=9t0VR6BCwSZk5ciPSuMzrN0gpfDG2lBoCtHsvoBN0vA=';
    return widget.classAndSection == widget.data.classAndSection ?Card(
      color: Colors.grey.shade50,
      elevation: 0.2,
      child: ListTile(

        leading: CircleAvatar(
          backgroundImage: NetworkImage(url),
          radius: 30,),
        title: Text(widget.data.name),
        subtitle: Text(widget.data.classAndSection),
        trailing: Text(checkingDate == ''?'A':'P',style: TextStyle(color: checkingDate == ''  ?Colors.red : Colors.green,fontSize: 20,fontWeight: FontWeight.bold),),
      ),
    ):SizedBox();
  }
}
