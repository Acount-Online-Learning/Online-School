import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:online_learning_app/modules/school/create_schedule.dart';
import 'package:online_learning_app/modules/student/community.dart';
import 'modules/parent/homeparent.dart';
import 'modules/school/schedule_school.dart';
import 'modules/school/home_School.dart';
import 'modules/student/SubjectExam.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primaryColor: HexColor('#6C5CE7'),
        appBarTheme: AppBarTheme(
            toolbarHeight: 60,
          backgroundColor: HexColor('#6C5CE7'),
         actionsIconTheme: IconThemeData(color: Colors.white,size: 30),
          elevation: 0
        ),
        iconTheme: IconThemeData(
          color:  HexColor('#6C5CE7')
        )
      ),
      home: Community(),
    );
  }
}

