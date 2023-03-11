import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'States.dart';

class SchoolCubit extends Cubit<SchoolStates>{
  SchoolCubit():super(initialSchoolState());
  static SchoolCubit get(context)=>BlocProvider.of(context);
  bool value=false;
  void ChangeContainer(){
    value=!value;
    emit(ChangeContainerSchoolState());
  }
  String? itemOne;
  String? itemTwo;
  void changeItemone(value){
    itemOne=value;
    emit(changeItemOneSchoolState());
  }
  void changeItemTwo(value){
    itemTwo=value;
    emit(changeItemTwoSchoolState());
  }
}