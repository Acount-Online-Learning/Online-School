import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_learning_app/modules/parent/Bloc/States.dart';

class CubitParent extends Cubit<ParentStates>{
  CubitParent():super(initialParentState());
  static CubitParent get(context)=>BlocProvider.of(context);
  bool value=false;
  void ChangeContainer(){
    value=!value;
    emit(ChangeContainerState());
  }
}