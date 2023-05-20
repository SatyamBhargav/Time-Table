import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'DataFetch.dart';

class TimeTable extends StatefulWidget {
  const TimeTable({super.key});

  @override
  State<TimeTable> createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  DateTime selectedValue = DateTime.now();

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            child: DatePicker(
              DateTime.now(),
              height: 100,
              width: 60,
              initialSelectedDate: DateTime.now(),
              selectionColor: Colors.red,
              selectedTextColor: Colors.white,
              onDateChange: (date) {
                setState(() {
                  selectedValue = date;
                  // print(selectedValue.weekday);
                });
              },
            ),
          ),
          Container(
            child: SizedBox(
              child: DataFetch(selectedValue.weekday),
              height: 460,
            ),
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 15),
                alignment: Alignment.bottomLeft,
                child: SizedBox(
                  width: 170,
                  height: 160,
                  child: Image(
                    image: AssetImage('assets/image.png'),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 50),
                child: Text(
                  'Boring...!',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
