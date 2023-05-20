import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataFetch extends StatelessWidget {
  //to access the different database

  final Query<Map<String, dynamic>> _timetable2 =
      FirebaseFirestore.instance.collection('mon').orderBy('num');

  final Query<Map<String, dynamic>> _timetable3 =
      FirebaseFirestore.instance.collection('tue').orderBy('num');

  final Query<Map<String, dynamic>> _timetable4 =
      FirebaseFirestore.instance.collection('wed').orderBy('num');

  final Query<Map<String, dynamic>> _timetable5 =
      FirebaseFirestore.instance.collection('ths').orderBy('num');

  final Query<Map<String, dynamic>> _timetable6 =
      FirebaseFirestore.instance.collection('fri').orderBy('num');

  final Query<Map<String, dynamic>> _timetable7 =
      FirebaseFirestore.instance.collection('weekend');

  final int weekdayvalue;
  DataFetch(this.weekdayvalue);

  setvauedd() {
    if (weekdayvalue == 1) {
      return _timetable2;
    } else if (weekdayvalue == 2) {
      return _timetable3;
    } else if (weekdayvalue == 3) {
      return _timetable4;
    } else if (weekdayvalue == 4) {
      return _timetable5;
    } else if (weekdayvalue == 5) {
      return _timetable6;
    } else if (weekdayvalue == 6 || weekdayvalue == 7) {
      return _timetable7;
    }
  }

//main code
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: setvauedd().snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final DocumentSnapshot documentSnapshot =
                  snapshot.data!.docs[index];
              return Card(
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  title: Text(documentSnapshot['title'],
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  trailing: Text(
                    documentSnapshot['class'],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  leading: Text(documentSnapshot['slot'],
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(
                    documentSnapshot['time'],
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
