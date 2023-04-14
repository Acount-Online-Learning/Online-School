import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:githubproject/modules/add_book/add_book.dart';
import 'package:githubproject/shared/bloc_observer.dart';
import 'package:githubproject/shared/cubit/cubit.dart';

import 'modules/addChildren/add_children.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer=MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)  =>EducationCubit(),
      child: ScreenUtilInit(
        builder: (
            BuildContext context,
            Widget? child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            debugShowCheckedModeBanner: false,
            home: AddChild(),
          );
        },
      ),
    );
  }
}
