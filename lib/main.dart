import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:online_learning_app/modules/Schools/Bloc/Cubit.dart';
import 'package:online_learning_app/modules/Schools/ClassesScreen.dart';
import 'package:online_learning_app/modules/parent/Bloc/Cubit.dart';
import 'package:online_learning_app/modules/parent/ExamsChildren.dart';
import 'package:online_learning_app/modules/student/Bloc/cubit.dart';
import 'package:online_learning_app/modules/student/ExamsScreen.dart';
import 'package:online_learning_app/modules/student/SubjectExam.dart';
import 'package:online_learning_app/modules/student/community.dart';
import 'modules/Schools/ResultScreen.dart';
import 'modules/Schools/RoomsScreen.dart';
import 'modules/Schools/TeacherScreen.dart';



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
      home: MultiBlocProvider(

          providers: [
            BlocProvider(create: (context)=>EducationCubit()),

            BlocProvider(create: (context)=>CubitParent()),
            BlocProvider(create: (context)=>SchoolCubit()),


          ],
          child: ExamScreen()
      ),
    );
  }
}

