import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class DatePickers extends StatelessWidget {
  ///Default Constructor
  const DatePickers({Key? key, required this.onchanged, required this.date}) : super(key: key);

  final Function(DateTime) onchanged;
  final String date;

  Future<void> _selectDate(BuildContext context) async {

    final d = await DatePicker.showDatePicker(
      context,
      minTime: DateTime(2022, 3, 5),
      maxTime: DateTime.now(),
      onConfirm: onchanged
    );

  }

  @override
  Widget build(BuildContext context) {


    return Container(
      margin: const EdgeInsets.only(
        
        left: 20,
        right: 20,
      ),
      decoration:const BoxDecoration(
        border: Border(
          bottom: BorderSide(
              width: 1.0
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Select Date',
          ),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: TextButton(
              onPressed: () {
                _selectDate(
                  context,
                );
              },
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    16,
                  ),
                ),

                textStyle: const TextStyle(
                  fontSize: 11,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.date_range),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      date,
                      style: TextStyle(
                        color: Theme.of(
                          context,
                        ).hintColor,
                        fontSize: 16,
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
