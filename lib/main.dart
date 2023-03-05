import 'package:education_learning/modules/QuestionScreen.dart';
import 'package:flutter/material.dart';

import 'modules/ExamsScreen.dart';
import 'modules/NoticeScreen.dart';
import 'modules/SubjectExam.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
     home: ExamScreen(),
    );
  }
}

