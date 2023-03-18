import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_learning_app/modules/Teacher/Bloc/States.dart';

class CubitTeacher extends Cubit<TeacherStates>{
  CubitTeacher():super(initialTeacherState());
  static CubitTeacher get(context)=>BlocProvider.of(context);

}